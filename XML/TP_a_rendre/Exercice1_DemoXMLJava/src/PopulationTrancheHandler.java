import org.xml.sax.Attributes;
import org.xml.sax.helpers.DefaultHandler;

public class PopulationTrancheHandler extends DefaultHandler {
    private int totalFemmes = 0;
    private int totalHommes = 0;

    @Override
    public void startElement(String uri, String localName, String qName, Attributes attrs) {
        if ("tranche".equalsIgnoreCase(qName)) {
            int age = Integer.parseInt(attrs.getValue("age"));
            if (age >= 18 && age <= 25) {
                // Récupère les effectifs
                int nbF = Integer.parseInt(attrs.getValue("nbFemmes"));
                int nbH = Integer.parseInt(attrs.getValue("nbHommes"));
                totalFemmes += nbF;
                totalHommes += nbH;
            }
        }
    }

    @Override
    public void endDocument() {
        System.out.println(">>>=== Résultat SAX ===<<<");
        System.out.println("Nombre de  Femmes ayant 18 à 25 ans : " + totalFemmes);
        System.out.println("Nombre  d'Hommes ayant 18 à 25 ans : " + totalHommes);
    }
}
