#This code is incomplete....

#Need to install the Python package.
pip install pypuppetdb

#Set the conneection
from pypuppetdb import connect
db=connect()

#Getting the list of node
nodes=db.nodes()
for node in nodes:
print(node)
