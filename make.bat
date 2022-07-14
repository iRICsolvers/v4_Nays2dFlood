@echo off

call "C:\Program Files (x86)\Intel\oneAPI\setvars.bat" intel64 vs2022

rem ----------------------------------------------------------------------
rem ifort compile
rem ----------------------------------------------------------------------
ifort .\src\iric.F90 ^
	.\src\common_hh.f90 ^
	.\src\GridCoordMod.F90 ^
	.\src\GridCondMod.F90 ^
	.\src\interpolation.F90 ^
	.\src\transform.F90 ^
	.\src\WriteCGNS.F90 ^
	.\src\output_hotstart.f90 ^
	.\src\read_hotstart_conditions.f90 ^
	.\src\flow_calculation.f90 ^
	.\lib\iriclib.lib ^
	.\src\nays2d_flood.f90 /MD /Qopenmp /nostandard-realloc-lhs -o .\nays2d_flood.exe
del *.obj
del *.mod

copy /y .\nays2d_flood.exe .\install
