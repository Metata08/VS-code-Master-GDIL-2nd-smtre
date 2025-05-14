import javax.xml.parsers.SAXParser;
import javax.xml.parsers.SAXParserFactory;

public class MainPublications{
    public static void main(String[] args) throws Exception {
        if (args.length != 1) {
            System.err.println("Usage: java MainPublications \"Nom Auteur\"");
            System.exit(1);
        }
        String auteur = args[0];

        SAXParserFactory factory = SAXParserFactory.newInstance();
        SAXParser parser = factory.newSAXParser();

        System.err.println("Liste des pulications :");
        
        parser.parse("dblp.xml", new ListePubAuteurViaSAX(auteur));  // exemple de auteur : Craig Gentry
    }
}