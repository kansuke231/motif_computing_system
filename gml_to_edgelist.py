import igraph
import sys


def main(filepath,rewire,save_path):
	G = igraph.read(filepath)
	
	if rewire:
		G.rewire()
	G.write(save_path,format="edgelist")

if __name__ == "__main__":
	params = sys.argv
	filepath = params[1]
	rewire = False
	save_path = params[3]	

	if params[2] == "rewire":
		rewire = True
		
	main(filepath,rewire,save_path)