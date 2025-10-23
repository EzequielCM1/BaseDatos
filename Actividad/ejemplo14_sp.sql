delimiter //
drop procedure if exists ejemplo14 //
create procedure ejemplo14(in num int)
begin
    declare contador int;
    if num > 0 then
        set contador = num;
        m_loop: loop
            select contador;
            set contador = contador - 1;
            if contador < 1 then
                leave m_loop;
            end if;
        end loop;
    end if;
end //
delimiter ;
CALL ejemplo14(5);
