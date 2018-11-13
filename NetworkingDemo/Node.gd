extends Control

var timer = 1
var UDP_listener = PacketPeerUDP.new()
var UDP_broadcaster = PacketPeerUDP.new()
var server_meta_agent = NetworkedMultiplayerENet.new()
var hosting = false

func start_hosting():
	if !hosting:
		hosting = true
		print(IP.get_local_addresses())
		if UDP_listener.listen(3000) != OK:
			print("Error")
		else:
			print("OK")
		if server_meta_agent.create_server(3001, 60) != OK:
			print("Error")
		else:
			print("OK")

func _ready():
	$StartHosting.connect("pressed", self, "start_hosting")
	
func _process(delta):
	
	if UDP_listener.get_available_packet_count() > 0:
		print("Something recieved")
		var array_bytes = UDP_listener.get_packet()
		var client_IP = UDP_listener.get_packet_ip()
		var pac = "check".to_ascii()
		if array_bytes == pac:
			UDP_listener.set_dest_address(client_IP, 3000)
			UDP_listener.put_packet("Hey! Listen!".to_ascii())
			print("got one")
	
	timer -= delta
	if timer <= 0 :
		timer = 15
		check_servers()

func check_servers():
	UDP_broadcaster.set_dest_address( "255.255.255.255" , 3000)
	UDP_broadcaster.put_packet("check".to_ascii())
	print("Broadcast sent")
