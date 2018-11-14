extends Control

var timer = 1
var UDP_listener = PacketPeerUDP.new()
var UDP_broadcaster = PacketPeerUDP.new()
var server_meta_agent = NetworkedMultiplayerENet.new()
var hosting = false
var host_IPs = []


func start_hosting():
	if !hosting:
		hosting = true
		print(IP.get_local_addresses())
		if UDP_listener.listen(3000) != OK:
			print("Error")
		else:
			print("OK")
		if server_meta_agent.create_server(3002, 60) != OK:
			print("Error")
		else:
			print("OK")
		Global.player = 1
		Global.enemy = 2

func _ready():
	
	if UDP_broadcaster.listen(3001) != OK:
		print("Error")
	else:
		print("OK")
	get_tree().connect("network_peer_connected", self, "boop")
	$StartHosting.connect("pressed", self, "start_hosting")
	$ServerList.append_agent("spam")
	
func _process(delta):
	
	if UDP_listener.get_available_packet_count() > 0:
		print("Something recieved")
		var array_bytes = UDP_listener.get_packet()
		var client_IP = UDP_listener.get_packet_ip()
		var pac = "check".to_ascii()
		if array_bytes == pac:
			UDP_listener.set_dest_address(client_IP, 3001)
			UDP_listener.put_packet("Hey!".to_ascii())
			print("got one")
	if UDP_broadcaster.get_available_packet_count() > 0:
		print("got another one")
		var array_bytes = UDP_broadcaster.get_packet()
		var host_IP = UDP_broadcaster.get_packet_ip()
		var pac = "Hey!".to_ascii()
		if array_bytes == pac:
		#if true:
			if ! host_IPs.has(host_IP): 
				print("bluh")
				host_IPs.append(host_IP)
				var lobby_client = NetworkedMultiplayerENet.new()
				if lobby_client.create_client(host_IP,3002) == OK:
					$ServerList.append_agent(lobby_client)
				else:
					print(":(")
			
	timer -= delta
	if timer <= 0 :
		timer = 5
		check_servers()

remote func boop(id):
	print("boop")
	print(id)


func check_servers():
	UDP_broadcaster.set_dest_address( "255.255.255.255" , 3000)
	UDP_broadcaster.put_packet("check".to_ascii())
	print("Broadcast sent")
	