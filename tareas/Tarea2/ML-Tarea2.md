# ML:Tarea2 - Eduardo Acuña Yeomans

## 1. ¿Qué es aprendizaje máquina?

####  1. ¿Qué tipo de *aprendizaje* (si aplica) describe mejor los siguientes problemas? :

#####  a) Un sistema de clasificación automática de monedas. Para realizar el sistema, los desarrolladores obtuvieron las especificaciones exactas del Banco de México sobre las monedas de $1$, $2$, $5$ y $10$ pesos. Con estas especificaciones desarrollaron un modelo estadístico basado en el peso, tamaño y denominación.
> El **aprendizaje supervisado** sería mejor ya que conocemos el conjunto de clasificaciones.

##### b)  Para un sistema simple, en lugar de utilizar las especificaciones, se utilizo un conjunto de monedas a las cuales se les midió peso y tamaño. El algoritmo utiliza esta información para encontrar umbrales que permitan distinguir una moneda de otra de diferente.
> En este caso considero que el mejor es el **aprendizaje no supervisado**, no conocemos que denominaciones hay, pudiera haber o de \$1.00, \$200, \$5.00 o de \$5.00, \$10.00, \$20.00 o incluso monedas chafonas poker o algo así y tendríamos que identificar cuales son los tipos de monedas en el conjunto.

##### c)  Un juego computacional que desarrolla en forma independiante una estrategia para ganar a partir de jugar muchas partidas en forma automática, penalizando las partidas que pierde.
> En este caso el mejor tipo de aprendizaje es el **aprendizaje por refuerzo** ya que cada partida que juega va mejorando su estrategia la cual es calificada con algun criterio.

#### 2.  ¿Cuales de los siguientes problemas, la mejor forma de resolverlos es con *aprendizaje máquina*?

##### a) Clasificar números en primos y no primos.
> No conviene usar aprendizaje máquina, la definición de un número primo es bastante precisa y algoritmos deterministas bastante eficientes se han desarrollado para determinar si un número es primo o no. Además, he leído que no se ha encontrado un patrón en la distribución de números primos en $\mathbb{R}$. 

> (Nada mas quería calar como se veían las letras nice con $\LaTeX$ utilizando markdown)
##### b) Detectar un probable fraude en una transacción bancaria.
> En este caso se me hace confuso responser, no se como funcionen las transacciones bancarias. Pero me suenta que si las transacciones son un desastre de datos y la inconsistencia en los datos está muy escondida dentro de un mar de información, el aprendizaje máquina pudiera ayudar. Tal vez considerando un conjunto de transacciones no fraudulentas y checar si la transacción en cuestión difiere.
##### c) Determinar el tiempo que le toma a un objeto caer de una altura dada.
> No es conveniente utilizar aprendizaje máquina en este caso ya que hay ecuaciones deterministas que se computan con un par de operaciones para medir el tiempo que tarda en caer un objeto. 
##### d) Determinar el ciclo óptimo de encendido de semaforos en una intersección con mucho tráfico.
> El ciclo óptimo no creo. Un ciclo lo suficientemente bueno: si. Esto lo comento ya hasta donde yo tengo conocimiento el tráfico no solo depende de una intersección, depende de toda una ciudad y del flujo de entrada y salida de automóviles a la ciudad. Además puede que haya cuestiones imprevistas para determinar el comportamiento del tráfico (por ejemplo accidentes o festivales o eventos que modifican el flujo de carros).

## 2. La desigualdad de Hoeffding

#### 1. Consideremos una urna con canicas verdes y rojas, de la que no conozco la cantidad total de canicas (pueden ser infinitas). La probabilidad de sacar una canica de color rojo es $\mu = 0,55$ (i.i.d., con remplazo). Esta urna puede ser vista como el conjunto de valores de $x \in X$ y el color es verde si la hipótesis escogida $h$ tiene el mismo resultado de la función $f$ . En este caso, tenemos una hipótesis cuyo error fuera de muestra es $E_{out}(h) = 0,55$. Un clasificador pero que un volado.

#### Consideremos que solamente conocemos el valor de $10$ canicas ($10$ ejemplos para entrenamiento).

##### 1. ¿Cuál es la probabilidad que $\nu = 0$ si solamente obtenemos una muestra de 10 canicas? Escribe un resultado lo más aproximado posible.
> $\nu$ es la fracción de canicas rojas, es decir, en la muestra hay $0$ canicas rojas de $10$ canicas. Esto implica que todas las canicas en la muestra son verdes.

##### 2. ¿Cuál es la probabilidad de encontrar $\nu = 0$ al menos una vez, si tomamos una muestra aleatoria de $10$ canicas, y esto lo repetimos $1000$ veces.
> 


## 3. El perceptrón y el error en muestra y fuera de muestra

#### 1. Para contestar las preguntas de esta sección es necesario realizar varios programas, los cuales pueden ser programados en cualquier lenguaje de programación de su elección. Los únicos lenguajes de programación que no se aceptan son `Brainfuck` y `Whitespace`.

##### 1. Realiza una funcion que reciba tres parámetros flotantes `w0`, `w1`, `w2` y dos valores `x1` y `x2`, y devuelva el valor: $$sign(w_1x_1 + w_2x_2 + w_0)$$

##### 2. Realiza una función que genere dos pares de valores $p_1 = (p_{1,1},p_{1,2})$ y $p_2 = (p_{2,1},p_{2,2})$, tal que $p_{i,j}$ sea un número aleatorio entre $0$ y $1$ con una distribución uniforme (el clasico `rand` de prácticamente todos los lenguajes), y encuentre los valores de $w_0$, $w_1$ y $w_2$ tales que $$w_1p_{1,1} + w_2p_{1,2}+w_0 = w_1p_{2,1}+w_2p_{2,2}+w_0 = 0$$ Estos tres parámetros nos definen completamente la función $f$.

##### 3. Realiza una función que genere $N$ puntos $p_i = (pi,1,pi,2)$ donde cada $p_{i,j}$ es un numero aleatorio entre $0$ y $1$ con distribución uniforme.
> 
##### 4. Generaliza la función del inciso 1, para asignar clase a cada uno de los $N$ puntos del inciso anterior.
> 
##### 5. Programa el algoritmo del perceptrón, para encontrar $g$ a partir de los $N$ datos clasificados. Encontrar $g$ equivale a encontrar los parámetros $wg_0$, $wg_1$, $wg_2$. Recuerda que para un conjunto de datos linealmente separables, el algoritmo del perceptrón siempre encuentra una solución $g$ tal que $E_{in}(g ) = 0$.
> 
##### 6. Programa una función que, a partir de la caracterización de $f$ por medio de $w_0$, $w_1$, $w_2$ y la caracterización de $g$ con $wg_0$, $wg_1$, $wg_2$ calcule $E_{out}(g )$. Una manera de estimar el error fuera de muestra es un un metodo tipo Montecarlo, a la fuerza bruta. Para esto, se genera un número muy grande de puntos aleatorios en el plano unitrio, y luego se calcula el porcentaje de error. Mientras más puntos se generen más preciso es el resultado.
> 
#### 2. Con estos programas (desarrollados y probados) contesta las siguientes preguntas:

##### 1. ¿Cuantas iteraciones le toma en promedio al algoritmo del perceptrón en converger, para diez valores en el conjunto de entrenamiento $N = 10$? Para tomar un número promedio de iteraciones hay que realizar esto al menos unas $100$ veces.
> 
##### 2. ¿Cual es el valor de $E_{out}(g ) = Pr(f (x) 6= g (x))$ para el algoritmo del perceptrón con $10$ valores en el conjunto de aprendizaje ($N = 10$).
> 
##### 3. ¿Cuantas iteraciones le toma en promedio al algoritmo del perceptrón en converger, para cien valores en elconjunto de entrenamiento $N = 100$? Para tomar un número promedio de iteraciones hay que realizar esto al menos unas $100$ veces.
> 
##### 4. ¿Cual es el valor de $E_{out}(g ) = Pr(f (x) 6= g (x))$ para el algoritmo del perceptrón con $100$ valores en el conjunto de aprendizaje ($N = 100$).
> 
