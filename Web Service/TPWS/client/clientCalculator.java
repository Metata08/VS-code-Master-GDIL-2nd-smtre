import org.tempuri.*;

public class clientCalculator {
    public static void main(String[] args) {
        try {
            CalculatorLocator calculatorLocator = new CalculatorLocator();
            CalculatorSoap calculatorSoap = calculatorLocator.getCalculatorSoap();

            int a=10;
            int b=5;

            int addResult = calculatorSoap.add(a, b);
            System.out.println("Addition : "+a+"+"+b+" = " + addResult);

            int subtractResult = calculatorSoap.subtract(a, b);
            System.out.println("Subtraction: "+a+"-"+b+" = " + subtractResult);

            int multiplyResult = calculatorSoap.multiply(a, b);
            System.out.println("Multiplication: "+a+"*"+b+" = " + multiplyResult);

            int divideResult = calculatorSoap.divide(a, b);
            System.out.println("Division: "+a+"/"+b+" = " + divideResult);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
