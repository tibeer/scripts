#
# Script to send something to Matrix chat
#
#########################################

from matrix_client.client import MatrixClient

username = "@foobar:matrix.org"
password = "abc123"
room_id = "!foobar:matrix.org"
base_url = "https://matrix.org"
text = "Hello!"

client = MatrixClient(base_url=base_url)
client.login(username=username, password=password)
room = client.join_room(room_id_or_alias=room_id)
room.send_text(text=text)
