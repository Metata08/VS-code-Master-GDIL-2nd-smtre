import java.util.*;

public class HopcroftKarp {
    private static final int NIL = 0;
    private static final int INF = Integer.MAX_VALUE;

    private int[] pairU, pairV, dist;
    private List<Integer>[] graph;
    private int U, V;

    public HopcroftKarp(int U, int V) {
        this.U = U;
        this.V = V;
        pairU = new int[U + 1];
        pairV = new int[V + 1];
        dist = new int[U + 1];
        graph = new ArrayList[U + 1];
        for (int i = 1; i <= U; i++) {
            graph[i] = new ArrayList<>();
        }
    }

    public void addEdge(int u, int v) {
        graph[u].add(v);
    }

    public int maxMatching() {
        Arrays.fill(pairU, NIL);
        Arrays.fill(pairV, NIL);
        int result = 0;

        while (bfs()) {
            for (int u = 1; u <= U; u++) {
                if (pairU[u] == NIL && dfs(u)) {
                    result++;
                }
            }
        }
        return result;
    }

    private boolean bfs() {
        Queue<Integer> queue = new LinkedList<>();
        for (int u = 1; u <= U; u++) {
            if (pairU[u] == NIL) {
                dist[u] = 0;
                queue.add(u);
            } else {
                dist[u] = INF;
            }
        }
        dist[NIL] = INF;

        while (!queue.isEmpty()) {
            int u = queue.poll();
            if (dist[u] < dist[NIL]) {
                for (int v : graph[u]) {
                    if (dist[pairV[v]] == INF) {
                        dist[pairV[v]] = dist[u] + 1;
                        queue.add(pairV[v]);
                    }
                }
            }
        }
        return dist[NIL] != INF;
    }

    private boolean dfs(int u) {
        if (u != NIL) {
            for (int v : graph[u]) {
                if (dist[pairV[v]] == dist[u] + 1 && dfs(pairV[v])) {
                    pairV[v] = u;
                    pairU[u] = v;
                    return true;
                }
            }
            dist[u] = INF;
            return false;
        }
        return true;
    }

    public static void main(String[] args) {
        // Exemple d'utilisation
        int U = 4; // Nombre de sommets dans l'ensemble U
        int V = 4; // Nombre de sommets dans l'ensemble V

        HopcroftKarp hk = new HopcroftKarp(U, V);

        // Ajouter les arêtes du graphe biparti
        hk.addEdge(1, 2);
        hk.addEdge(1, 3);
        hk.addEdge(2, 1);
        hk.addEdge(3, 2);
        hk.addEdge(4, 3);
        hk.addEdge(4, 4);



       


        int maxMatching = hk.maxMatching();
        System.out.println("Taille du couplage maximum : " + maxMatching);
    }
}