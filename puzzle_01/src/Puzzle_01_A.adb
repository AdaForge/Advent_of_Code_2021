-- ------------------------------------------------
-- Author : William J. FRANCK
-- e-Mail : william@sterna.io
--
-- Initial creation date : 2021-12-01
-- ------------------------------------------------
-- License : CC-BY-SA
-- ------------------------------------------------

with Ada.Command_Line; use Ada.Command_Line;
with Ada.Text_IO;      use Ada.Text_IO;
with Ada.Strings.Bounded;

procedure Puzzle_01_A is

    Current_Depth, Previous_Depth : Natural := 0;

    DepthCount_Increasing : Natural := 0;

    First_record : Boolean := True;

    Data_File : File_Type;

    package OS_File_Name is new Ada.Strings.Bounded.Generic_Bounded_Length (1_024);
    Data_File_Name : OS_File_Name.Bounded_String;

    Missing_FileName : exception;

begin

    -- get the filename
    if Argument_Count /= 1 then
        raise Missing_FileName;
    end if;

    Data_File_Name := OS_File_Name.To_Bounded_String (Argument (1));

    -- Open and read the file
    Open (File => Data_File, Mode => In_File, Name => OS_File_Name.To_String (Data_File_Name));

    while not End_Of_File (Data_File) loop
        Current_Depth := Natural'Value (Get_Line (Data_File));
        -- put_line(Current_Depth'Image);
        if Current_Depth > Previous_Depth and not First_record then
            DepthCount_Increasing := @ + 1;
        end if;
        Previous_Depth := Current_Depth;
        First_record   := False;
    end loop;

    Close (Data_File);

    -- Open and read the file
    Put_Line ("Number of Depth increases = " & DepthCount_Increasing'Image); -- 1564

end Puzzle_01_A;