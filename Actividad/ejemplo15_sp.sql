delimiter //

drop procedure if exists ejemplo15 //

create procedure ejemplo15(in p_idarticulo int, in p_nombre varchar(15), in p_precio int)
begin
    if p_idarticulo is not null then
        if not exists (select 1 from articulos where id_articulo = p_idarticulo) then
            insert into articulos (id_articulo, nombre, precio) values (p_idarticulo, p_nombre, p_precio);
            select 'artículo insertado correctamente' as mensaje;
        else
            select 'error: el artículo con esta clave ya existe' as mensaje;
        end if;
    else
        select 'error: la clave no puede ser null' as mensaje;
    end if;
end //

delimiter ;

call ejemplo15(5, 'articulo5', 500); 
