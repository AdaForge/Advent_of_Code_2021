with Bingo;
use Bingo;

with Bingo.Board;
use Bingo.Board;

with Ada.Text_IO;
use Ada.Text_IO;
use Ada;

package body Bingo.Boards_IO is

    use Bingo_Data_String;

    procedure store_Row (Data : in Bingo_Data_String.Bounded_String; is_First_Row : Boolean) is

        this_Data     : Bingo_Data_String.Bounded_String;
        Some_Row      : Row_array;
        Index         : Positive := H_Index'First;
        Number        : Called_Number;
        end_of_Number : Positive;

        MAX_OF_NUMBERS_PER_ROW_REACHED : exception;

    begin
        this_Data := Data;
        if is_First_Row then
            create_New_Board;
        end if;

        Index := H_Index'First;

        while Length (this_Data) > 0 loop

            Called_Number_IO.Get
               (From => To_String (this_Data),
                Item => Number,
                Last => end_of_Number);

            if Index <= H_Index'Last then
                Some_Row (Index) := Number;
                Index            := @ + 1;
            else
                raise MAX_OF_NUMBERS_PER_ROW_REACHED;
            end if;

            Bounded_Slice
               (Source => this_Data,
                Target => this_Data,
                Low    => end_of_Number + 1,
                High   => Length (this_Data));

        end loop;

        store_Row (Some_Row);

    exception
        when MAX_OF_NUMBERS_PER_ROW_REACHED =>
            Text_IO.New_Line;
            Text_IO.Put_Line
               (Standard_Error,
                "EXCEPTION: No more space left in row #" & get_Current_Row'Image & " of this board [" &
                get_Actual_nb_of_Boards'Image & "] !!");
            raise;
    end store_Row;

end Bingo.Boards_IO;
