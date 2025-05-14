import javax.swing.*;
import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.util.*;

public class HopcroftKarpSwing extends JFrame {
    private static final int NIL = 0;
    private static final int INF = Integer.MAX_VALUE;

    private int[] pairU, pairV, dist;
    private java.util.List<Integer>[] graph; // Utilisation explicite de java.util.List
    private int U, V;

    private JTextField uField, vField;
    private JTextArea edgeArea;
    private JButton calculateButton;
    private GraphPanel graphPanel;

    public HopcroftKarpSwing() {
        setTitle("Hopcroft-Karp Algorithm");
        setSize(800, 600);
        setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        setLayout(new BorderLayout());

        // Panel pour les entrées
        JPanel inputPanel = new JPanel(new GridLayout(5, 2));
        inputPanel.add(new JLabel("Nombre de sommets dans U:"));
        uField = new JTextField();
        inputPanel.add(uField);
        inputPanel.add(new JLabel("Nombre de sommets dans V:"));
        vField = new JTextField();
        inputPanel.add(vField);
        inputPanel.add(new JLabel("Arêtes (format: u-v, séparées par des virgules):"));
        edgeArea = new JTextArea();
        JScrollPane edgeScroll = new JScrollPane(edgeArea);
        inputPanel.add(edgeScroll);
        add(inputPanel, BorderLayout.NORTH);

        // Panel pour la représentation graphique
        graphPanel = new GraphPanel();
        add(graphPanel, BorderLayout.CENTER);

        // Bouton pour calculer
        calculateButton = new JButton("Calculer le couplage maximum");
        calculateButton.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                calculateMatching();
            }
        });
        add(calculateButton, BorderLayout.SOUTH);
    }

    @SuppressWarnings("unchecked")
    private void initializeGraph(int U, int V) {
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

    private void calculateMatching() {
        try {
            // Lire les entrées
            int U = Integer.parseInt(uField.getText());
            int V = Integer.parseInt(vField.getText());
            String[] edges = edgeArea.getText().split(",");

            // Initialiser le graphe
            initializeGraph(U, V);

            // Ajouter les arêtes
            for (String edge : edges) {
                String[] nodes = edge.trim().split("-");
                int u = Integer.parseInt(nodes[0]);
                int v = Integer.parseInt(nodes[1]);
                addEdge(u, v);
            }

            // Calculer le couplage maximum
            int maxMatching = maxMatching();

            // Mettre à jour la représentation graphique
            graphPanel.setGraph(graph, pairU, U, V);
            graphPanel.repaint();

            // Afficher le résultat
            JOptionPane.showMessageDialog(this, "Taille du couplage maximum : " + maxMatching);
        } catch (Exception e) {
            JOptionPane.showMessageDialog(this, "Erreur : Vérifiez les entrées.", "Erreur", JOptionPane.ERROR_MESSAGE);
        }
    }

    public static void main(String[] args) {
        SwingUtilities.invokeLater(new Runnable() {
            @Override
            public void run() {
                HopcroftKarpSwing frame = new HopcroftKarpSwing();
                frame.setVisible(true);
            }
        });
    }

    // Classe interne pour dessiner le graphe
    class GraphPanel extends JPanel {
        private java.util.List<Integer>[] graph;
        private int[] pairU;
        private int U, V;

        public void setGraph(java.util.List<Integer>[] graph, int[] pairU, int U, int V) {
            this.graph = graph;
            this.pairU = pairU;
            this.U = U;
            this.V = V;
        }

        @Override
        protected void paintComponent(Graphics g) {
            super.paintComponent(g);
            if (graph == null) return;

            int panelWidth = getWidth();
            int panelHeight = getHeight();

            // Dessiner les sommets de U
            int uRadius = 20;
            int uX = panelWidth / 4;
            int uYStep = panelHeight / (U + 1);
            for (int u = 1; u <= U; u++) {
                int y = u * uYStep;
                g.setColor(Color.BLUE);
                g.fillOval(uX - uRadius, y - uRadius, 2 * uRadius, 2 * uRadius);
                g.setColor(Color.BLACK);
                g.drawString("U" + u, uX - uRadius / 2, y + uRadius / 2);
            }

            // Dessiner les sommets de V
            int vRadius = 20;
            int vX = 3 * panelWidth / 4;
            int vYStep = panelHeight / (V + 1);
            for (int v = 1; v <= V; v++) {
                int y = v * vYStep;
                g.setColor(Color.RED);
                g.fillOval(vX - vRadius, y - vRadius, 2 * vRadius, 2 * vRadius);
                g.setColor(Color.BLACK);
                g.drawString("V" + v, vX - vRadius / 2, y + vRadius / 2);
            }

            // Dessiner les arêtes
            g.setColor(Color.BLACK);
            for (int u = 1; u <= U; u++) {
                for (int v : graph[u]) {
                    int uY = u * uYStep;
                    int vY = v * vYStep;
                    g.drawLine(uX + uRadius, uY, vX - vRadius, vY);
                }
            }

            // Dessiner le couplage
            g.setColor(Color.GREEN);
            for (int u = 1; u <= U; u++) {
                if (pairU[u] != NIL) {
                    int v = pairU[u];
                    int uY = u * uYStep;
                    int vY = v * vYStep;
                    g.drawLine(uX + uRadius, uY, vX - vRadius, vY);
                }
            }
        }
    }
}