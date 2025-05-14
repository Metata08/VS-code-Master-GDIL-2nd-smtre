java -cp "axis-1_4/lib/activation.jar:axis-1_4/lib/axis-schema.jar:axis-1_4/lib/commons-discovery-0.2.jar:axis-1_4/lib/jaxrpc.jar:axis-1_4/lib/mail.jar:axis-1_4/lib/wsdl4j-1.5.1.jar:axis-1_4/lib/axis-ant.jar:axis-1_4/lib/axis.jar:axis-1_4/lib/commons-logging-1.0.4.jar:axis-1_4/lib/log4j-1.2.8.jar:axis-1_4/lib/saaj.jar:axis-1_4/lib/xerces.jar" org.apache.axis.wsdl.WSDL2Java calculator.wsdl

-creation du client clientCalculator.java 

java -cp "axis-1_4/lib/activation.jar:axis-1_4/lib/axis-schema.jar:axis-1_4/lib/commons-discovery-0.2.jar:axis-1_4/lib/jaxrpc.jar:axis-1_4/lib/mail.jar:axis-1_4/lib/wsdl4j-1.5.1.jar:axis-1_4/lib/axis-ant.jar:axis-1_4/lib/axis.jar:axis-1_4/lib/commons-logging-1.0.4.jar:axis-1_4/lib/log4j-1.2.8.jar:axis-1_4/lib/saaj.jar:axis-1_4/lib/xerces.jar"  clientCalculator.java


javac -cp "axis-1_4/lib/activation.jar:axis-1_4/lib/axis-schema.jar:axis-1_4/lib/commons-discovery-0.2.jar:axis-1_4/lib/jaxrpc.jar:axis-1_4/lib/mail.jar:axis-1_4/lib/wsdl4j-1.5.1.jar:axis-1_4/lib/axis-ant.jar:axis-1_4/lib/axis.jar:axis-1_4/lib/commons-logging-1.0.4.jar:axis-1_4/lib/log4j-1.2.8.jar:axis-1_4/lib/saaj.jar:axis-1_4/lib/xerces.jar"  -d bin org/tempuri/*.java 
