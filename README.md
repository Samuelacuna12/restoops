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
Esta primera versión guarda los datos en `localStorage` del navegador. No usa cuentas ni autenticación. Está estructurada para migrar posteriormente a Supabase/Postgres sin cambiar el modelo funcional.

## Cálculos
- Costo base = costo total de compra / cantidad normalizada.
- Costo del plato = suma del consumo de ingredientes + empaque + otros costos variables.
- Margen bruto = (precio - costo) / precio.
- Food cost = costo / precio.
- Precio sugerido = costo / (1 - margen objetivo).