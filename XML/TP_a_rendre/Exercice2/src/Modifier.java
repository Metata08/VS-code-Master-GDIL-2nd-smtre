import java.io.File;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.transform.OutputKeys;
import javax.xml.transform.Transformer;
import javax.xml.transform.TransformerFactory;
import javax.xml.transform.dom.DOMSource;
import javax.xml.transform.stream.StreamResult;
import org.w3c.dom.*;

public class Modifier {
    public static void main(String[] args) throws Exception {

        DocumentBuilderFactory db_Factory = DocumentBuilderFactory.newInstance();
        DocumentBuilder db_Builder = db_Factory.newDocumentBuilder();
        Document Doc = db_Builder.parse(new File("dblp.xml"));
        NodeList Liste_www = Doc.getElementsByTagName("www");
        for (int i = 0; i < Liste_www.getLength(); i++) {
            Element www = (Element) Liste_www.item(i);
            if ("2004-03-23".equals(www.getAttribute("mdate"))) {
                // Modification de la date
                www.setAttribute("mdate", "2023-03-23");
                // Ajout d'un nouvel auteur
                Element newAuthor = Doc.createElement("author");
                newAuthor.setTextContent("Le Nouvel Auuteur");
                www.appendChild(newAuthor);
                // Modification du titre
                NodeList titles = www.getElementsByTagName("title");
                if (titles.getLength() > 0) {
                    Element title = (Element) titles.item(0);
                    title.setTextContent("Nouveau titre de la page personnelle");
                }
                break;
            }
        }

        TransformerFactory tf = TransformerFactory.newInstance();
        Transformer transformer = tf.newTransformer();
        transformer.setOutputProperty(OutputKeys.INDENT, "yes");
        transformer.setOutputProperty("{http://xml.apache.org/xslt}indent-amount", "2");
        transformer.transform(new DOMSource(Doc),
                new StreamResult(new File("dblp_modifie.xml")));

        System.out.println("dblp_modifie.xml généré.");
    }
}
