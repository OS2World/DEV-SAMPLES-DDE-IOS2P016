# Created by IBM WorkFrame/2 MakeMake at 16:19:09 on 08/12/94
#
# This makefile should be run in the following directory:
#   D:\AWI\016
#
# The actions included in this makefile are:
#   BIND::Resource Bind
#   COMPILE::C Set ++ Compile
#   COMPILE::Resource Compile
#   LINK::C Set ++ Link

.all: \
  .\IOS2P016.EXE

.SUFFIXES:

.SUFFIXES: .C .RC

.RC.res:
      @echo WF::COMPILE::Resource Compile
      rc.exe -r %s %|fF.RES

.C.obj:
      @echo WF::COMPILE::C Set ++ Compile
      icc.exe /Tdc /Q /Wcnddcleffgeniniobsordparprorearettruuse /O /G4 /C %s

.\IOS2P016.EXE: \
    .\IOS2P016.obj \
    .\IOS2P016.res \
    {$(LIB)}IOS2P016.DEF \
    IOS2P016.MAK
      @echo WF::LINK::C Set ++ Link
      icc.exe @<<
 /B" /f /base:65536 /pmtype:pm /packd /align:1 /nologo"
 /Fe"IOS2P016.EXE" 
 IOS2P016.DEF
 .\IOS2P016.obj
<<
      @echo WF::BIND::Resource Bind
      rc.exe .\IOS2P016.res IOS2P016.EXE

.\IOS2P016.res: \
    D:\AWI\016\IOS2P016.RC \
    {$(INCLUDE)}IOS2P016.H \
    IOS2P016.MAK

.\IOS2P016.obj: \
    D:\AWI\016\IOS2P016.C \
    {D:\AWI\016;$(INCLUDE);}IOS2P016.H \
    IOS2P016.MAK

