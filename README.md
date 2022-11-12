# Sistema de Supresión de Ruido de Red Eléctrica

1. **¿Cuál es la frecuencia de muestreo con que fue tomada la señal?**

Ejecutando:

```bash
./1_detect_fs.m
```

Se determina que es 48 kHz

2. **Utilice la DFT para desplegar el contenido espectral de la señal en su totalidad. Asegúrese que el eje x de los gráficos tenga las unidades apropiadas en frecuencia (Hz).**

![Spectrum DFT](./figure1.jpg)

Se puede reproducir ejecutando:

```bash
./2_3_4_complete_dft.m
```

3. **Identifique en el espectro las componentes de frecuencia causadas por la l ́ınea de poder de 60Hz, así como sus posibles armónicos. Para ello, realice una ampliación del espectro en la región de interés pero asegúrese que las unidades se mantengan correcta.**

![Zoomed Spectrum DFT](./figure2.jpg)

Se puede reproducir ejecutando:

```bash
./2_3_4_complete_dft.m
```

Se pueden notar las armónicas:

1. 60 Hz
2. 120 Hz
3. 180 Hz
4. 240 Hz
5. 300 Hz
6. 360 Hz (aunque no tiene mucha amplitud)
7. 420 Hz

En general, en electrónica de potencia y líneas de distribución de potencia, las tres primeras armónicas impares son las más problemáticas a nivel y usualmente deben ser atacadas para no perjudicar a la red eléctrica.

4. **Presente la Transformada Discreta de Fourier de Corto Plazo para 4 ventanas distintas de mucho menor tamaño. Identifique las mismas componentes parásitas en dichos espectros**

![STFT](./figure3.jpg)

Se puede reproducir ejecutando:

```bash
./2_3_4_complete_dft.m
```

