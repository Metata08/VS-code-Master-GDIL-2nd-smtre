import java.io.File;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.xpath.*;
import org.w3c.dom.*;

public class ListePubViaXPATH {
    public static void main(String[] args) throws Exception {
        Document Doc = DocumentBuilderFactory.newInstance()
                .newDocumentBuilder()
                .parse(new File("dblp.xml"));

        XPath xpath = XPathFactory.newInstance().newXPath();
        // Sélection de la conference CNRIA2022
        String prompt = "//inproceedings[booktitle='CNRIA2022']";
        NodeList publications = (NodeList) xpath.evaluate(prompt, Doc, XPathConstants.NODESET);

        for (int i = 0; i < publications.getLength(); i++) {
            Element pub = (Element) publications.item(i);
            String titre = pub.getElementsByTagName("title").item(0).getTextContent();
            NodeList auteurs = pub.getElementsByTagName("author");
            System.out.print("Titre: " + titre + " — Auteur(s): ");
            for (int j = 0; j < auteurs.getLength(); j++) {
                System.out.print(auteurs.item(j).getTextContent()
                        + (j < auteurs.getLength() - 1 ? ", " : ""));
            }
            System.out.println();
        }
    }
}
