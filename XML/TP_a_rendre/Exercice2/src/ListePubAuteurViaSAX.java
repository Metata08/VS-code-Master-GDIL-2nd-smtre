import org.xml.sax.Attributes;
import org.xml.sax.helpers.DefaultHandler;

public class ListePubAuteurViaSAX extends DefaultHandler {
    private final String targetAuthor;
    private boolean Auteur = false, Titre = false, ok = false;
    private StringBuilder buffer = new StringBuilder();

    public ListePubAuteurViaSAX(String auteur) {
        this.targetAuthor = auteur;
    }

    @Override
    public void startElement(String uri, String localName, String qName, Attributes attrs) {
        if ("author".equals(qName)) {
            Auteur = true; buffer.setLength(0);
        }
        if ("title".equals(qName)) {
            Titre = true; buffer.setLength(0);
        }
    }

    @Override
    public void characters(char[] ch, int start, int length) {
        if (Auteur || Titre) buffer.append(ch, start, length);
    }

    @Override
    public void endElement(String uri, String localName, String qName) {
        if ("author".equals(qName)) {
            if (buffer.toString().equalsIgnoreCase(targetAuthor)) {
                ok = true;
            }
            Auteur = false;
        }
        if ("title".equals(qName)) {
            if (ok) {
                System.out.println("->" + buffer.toString());
                ok = false;
            }
            Titre = false;
        }
    }
}
