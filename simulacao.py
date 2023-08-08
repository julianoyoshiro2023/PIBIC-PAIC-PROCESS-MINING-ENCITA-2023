import sys
import argparse
import numpy as np
from igraph import *
import random as rd
import os
from model_gen import ModelGenerator
from model_gen import ModelGeneratorNS
from model_gen import DynamicManufacturing
# Para rodar basta inserir na linha de comando:
# python simulacao.py -n 8 -s 4 -r 2 -o output.txt


# argument parser
ap = argparse.ArgumentParser()
ap.add_argument("-n", "--nodes", required=True, type=int)
ap.add_argument("-s", "--production_steps", required=True, type=int)
ap.add_argument("-f", "--first_step", type=int, default=-1)
ap.add_argument("-l", "--last_step", type=int, default=-1)
ap.add_argument("-r", "--seed", required=True, type=int) 
ap.add_argument("-o", "--output", required=True, default="-")
ap.add_argument("-t", "--production", default="constant")
ap.add_argument("-i", "--samples", type=int, default=30)

args = vars(ap.parse_args())

print("[INFO] Generating graph...")

# pequeno rd.randint(5,12)
# grande rd.randint(13, 20)
# densa rd.random()*(0.3 - 0.05) + 0.15
# N densa rd.random()*(1 - 0.5) + 0.5

# ================================ PEQUENA E NÃO DENSA ===========================

i = 0
while( i < 1000):
    steps=rd.randint(5,12)
    mg = ModelGeneratorNS(n=int(steps/(rd.random()*(1 - 0.5) + 0.5)),
                        s=steps,
                        first_step=args["first_step"],
                        last_step=args["last_step"],
                        buffer_size=3,
                        rng =np.random.default_rng( args["seed"]))
    #rng= args["rng"]
    #ws, edges, edge_attr, vertex_attr = mg.generate_graph()
    ws, edges, vertex_attr = mg.generate_graph()
    # print(f"ws: {ws}")
    # print(f"edges: {edges}")
    # print(f"vertex_attr: {vertex_attr}")

    g = Graph(n=args["nodes"], edges=edges, directed=True,
                    vertex_attrs=vertex_attr)

    assert(g.is_dag())

    # drawing graphs
    layout = g.layout("kamada_kawai")
    plot(g, layout=layout)

    print("[INFO] Starting dynamic model...")
    system = DynamicManufacturing(g, args["seed"])


# run the dynamic simulation and output the results to the defined medium
    with open(os.path.join("C:\\Users\\julia\\CLEMATIS\\PequenaNDensa","event_log"+ str(i) + ".txt"), "w") as event_log:
        with open("log"+ str(i) + ".txt", "w") as u:
            with sys.stdout if args["output"] == "-" else open(args["output"], "w") as f:
                production = 0
                runs = 0
                while production < 100:
                    print("[INFO] run: {}".format(u))
                    production = production + system.iterate(f, args["output"], event_log=event_log, log=u)[0]
                    runs = runs + 1
    i = i + 1

# ================================ PEQUENA E DENSA ===========================

i = 0
while( i < 1000):
    steps=rd.randint(5,12)
    mg = ModelGeneratorNS(n=int(steps/(rd.random()*(0.3 - 0.05) + 0.15)),
                        s=steps,
                        first_step=args["first_step"],
                        last_step=args["last_step"],
                        buffer_size=3,
                        rng =np.random.default_rng( args["seed"]))
    #rng= args["rng"]
    #ws, edges, edge_attr, vertex_attr = mg.generate_graph()
    ws, edges, vertex_attr = mg.generate_graph()
    # print(f"ws: {ws}")
    # print(f"edges: {edges}")
    # print(f"vertex_attr: {vertex_attr}")

    g = Graph(n=args["nodes"], edges=edges, directed=True,
                    vertex_attrs=vertex_attr)

    assert(g.is_dag())

    # drawing graphs
    layout = g.layout("kamada_kawai")
    plot(g, layout=layout)

    print("[INFO] Starting dynamic model...")
    system = DynamicManufacturing(g, args["seed"])


# run the dynamic simulation and output the results to the defined medium
    with open(os.path.join("C:\\Users\\julia\\CLEMATIS\\PequenaDensa","event_log"+ str(i) + ".txt"), "w") as event_log:
        with open("log"+ str(i) + ".txt", "w") as u:
            with sys.stdout if args["output"] == "-" else open(args["output"], "w") as f:
                production = 0
                runs = 0
                while production < 100:
                    print("[INFO] run: {}".format(u))
                    production = production + system.iterate(f, args["output"], event_log=event_log, log=u)[0]
                    runs = runs + 1
    i = i + 1


# ================================ GRANDE E NÃO DENSA ===========================

i = 0
while( i < 1000):
    steps=rd.randint(18, 25)
    mg = ModelGeneratorNS(n=int(steps/(rd.random()*(1 - 0.5) + 0.5)),
                        s=steps,
                        first_step=args["first_step"],
                        last_step=args["last_step"],
                        buffer_size=3,
                        rng =np.random.default_rng( args["seed"]))
    #rng= args["rng"]
    #ws, edges, edge_attr, vertex_attr = mg.generate_graph()
    ws, edges, vertex_attr = mg.generate_graph()
    # print(f"ws: {ws}")
    # print(f"edges: {edges}")
    # print(f"vertex_attr: {vertex_attr}")

    g = Graph(n=args["nodes"], edges=edges, directed=True,
                    vertex_attrs=vertex_attr)

    assert(g.is_dag())

    # drawing graphs
    layout = g.layout("kamada_kawai")
    plot(g, layout=layout)

    print("[INFO] Starting dynamic model...")
    system = DynamicManufacturing(g, args["seed"])


# run the dynamic simulation and output the results to the defined medium
    with open(os.path.join("C:\\Users\\julia\\CLEMATIS\\GrandeNDensa","event_log"+ str(i) + ".txt"), "w") as event_log:
        with open("log"+ str(i) + ".txt", "w") as u:
            with sys.stdout if args["output"] == "-" else open(args["output"], "w") as f:
                production = 0
                runs = 0
                while production < 100:
                    print("[INFO] run: {}".format(u))
                    production = production + system.iterate(f, args["output"], event_log=event_log, log=u)[0]
                    runs = runs + 1
    i = i + 1

# ================================ GRANDE E DENSA ===========================

i = 0
while( i < 1000):
    steps=rd.randint(18, 25)
    mg = ModelGeneratorNS(n=int(steps/(rd.random()*(0.3 - 0.05) + 0.15)),
                        s=steps,
                        first_step=args["first_step"],
                        last_step=args["last_step"],
                        buffer_size=3,
                        rng =np.random.default_rng( args["seed"]))
    #rng= args["rng"]
    #ws, edges, edge_attr, vertex_attr = mg.generate_graph()
    ws, edges, vertex_attr = mg.generate_graph()
    # print(f"ws: {ws}")
    # print(f"edges: {edges}")
    # print(f"vertex_attr: {vertex_attr}")

    g = Graph(n=args["nodes"], edges=edges, directed=True,
                    vertex_attrs=vertex_attr)

    assert(g.is_dag())

    # drawing graphs
    layout = g.layout("kamada_kawai")
    plot(g, layout=layout)

    print("[INFO] Starting dynamic model...")
    system = DynamicManufacturing(g, args["seed"])


# run the dynamic simulation and output the results to the defined medium
    with open(os.path.join("C:\\Users\\julia\\CLEMATIS\\GrandeDensa","event_log"+ str(i) + ".txt"), "w") as event_log:
        with open("log"+ str(i) + ".txt", "w") as u:
            with sys.stdout if args["output"] == "-" else open(args["output"], "w") as f:
                production = 0
                runs = 0
                while production < 100:
                    print("[INFO] run: {}".format(u))
                    production = production + system.iterate(f, args["output"], event_log=event_log, log=u)[0]
                    runs = runs + 1
    i = i + 1