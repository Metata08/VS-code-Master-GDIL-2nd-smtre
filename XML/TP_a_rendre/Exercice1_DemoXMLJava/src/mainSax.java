import javax.xml.parsers.SAXParser;
import javax.xml.parsers.SAXParserFactory;

public class mainSax {
    public static void main(String[] args) {
        try {
            //parser
            SAXParserFactory factory = SAXParserFactory.newInstance();
            SAXParser parser = factory.newSAXParser();

            // creation du  handler
            PopulationTrancheHandler handler = new PopulationTrancheHandler();
            parser.parse("population.xml", handler);

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
