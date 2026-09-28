# RestoOps v1

Sistema inicial de costos, recetas, proyección, ventas e inventario para:
- Asu Mare
- Oh My Chicken
- Don Arroz

## Uso
1. Abra `index.html`.
2. Cree ingredientes indicando cantidad comprada, unidad y costo total.
3. Cree platos y agregue la cantidad exacta de cada ingrediente usada por plato.
4. Use Proyección para simular cantidades, ventas, costo, utilidad y necesidades de compra.
5. Registre ventas reales; el sistema calcula utilidad y descuenta inventario.
6. Use Respaldo para exportar/importar toda la información en JSON.

## Persistencia actual
Los datos se sincronizan globalmente con Supabase mediante una fila compartida en `public.restoops_state`. El navegador conserva una copia local como caché/fallback si se pierde la conexión. Esta versión todavía no usa cuentas ni autenticación, por lo que todos los dispositivos que abran la aplicación comparten el mismo estado.

## Cálculos
- Costo base = costo total de compra / cantidad normalizada.
- Costo del plato = suma del consumo de ingredientes + empaque + otros costos variables.
- Margen bruto = (precio - costo) / precio.
- Food cost = costo / precio.
- Precio sugerido = costo / (1 - margen objetivo).