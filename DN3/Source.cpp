// DN 3:  Izračun integrala s trapezno metodo


#include <iostream>

#include <cmath>


// Izračun arctan

double arctan(double x) {

    double vsota = 0.0;
    double term = x;
    double power = x*x;
    int n = 1;

    while (fabs(term) > 1e-8) {
        vsota += term;
        term = -term * power / (2 * n + 1);
        power *= x * x;
        n++;
    }


    return vsota;
}


// Izračun e^(3x)

double exp_3x(double x) {
    return exp(3 * x);
}

// Integracija s pomočjo trapezne metode

double trapezoidal_integration(double (*f)(double), double a, double b, int n) {
    double h = (b - a) / n;
    double vsota = 0.5 * (f(a) + f(b));

    for (int i = 1; i < n; i++) {
        double x = a + i * h;
        vsota
            += f(x);
    }

    return h * vsota;
}

int main() {

    double pi = acos(-1.0);   // vrednost PI

    int n = 1000;  // število podintervalov

    double b = pi / 4.0;   // zgornja meja integrala
    double a = 0.0;  // spodnja meja

    

    double result = trapezoidal_integration([](double x) {

        return exp_3x(x) * arctan(x / 2.0);
        }, a, b, n);

    std::cout << "Izracunana ocena vrednosti dolocenega integrala je    " << result << std::endl;

    return 0;
}
