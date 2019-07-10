with Ada.Text_IO; use Ada.Text_IO;
with Submarine; use Submarine;

procedure Main is

   Airlock: AirLocks;
   Uboat: Sub := (SurfaceLevel => Surface, OxygenWarning => Off, MaxDepth => 2500, Depth => Depth_Index'First,  BaySelect => 1);
   Otank: OxygenTank;
   ReactorCore: Reactor := (CurrentTemp => 1 , MaxTemp => 100);
   tor : TorpedoRack := (others =>  Empty);
   slot: Bay := Empty;
   torT: TorpedoTube := (others =>  Empty);


begin


   Ada.Text_IO.Put(ASCII.ESC & "[2J");
   Put_Line("System Boot In-Progress ...Please Wait");
   delay 2.0;
     Ada.Text_IO.Put(ASCII.ESC & "[2J");
   Put_Line(".");
   delay 0.1;
   Ada.Text_IO.Put(ASCII.ESC & "[2J");
   Put_Line("..");
    delay 0.1;
   Ada.Text_IO.Put(ASCII.ESC & "[2J");
   Put_Line("...");
    delay 0.1;
   Ada.Text_IO.Put(ASCII.ESC & "[2J");
   Put_Line("....");
    delay 0.1;
   Ada.Text_IO.Put(ASCII.ESC & "[2J");
   Put_Line(".....");
    delay 0.1;
   Ada.Text_IO.Put(ASCII.ESC & "[2J");
   Put_Line(".......");
    delay 0.1;
   Ada.Text_IO.Put(ASCII.ESC & "[2J");
   Put_Line(".........");
    delay 0.1;
   Ada.Text_IO.Put(ASCII.ESC & "[2J");
   Put_Line("...........");
    delay 0.1;
   Ada.Text_IO.Put(ASCII.ESC & "[2J");
    delay 0.1;
   Put_Line("...............");
   delay 0.1;
   Ada.Text_IO.Put(ASCII.ESC & "[2J");
   Put_Line("System Boot Completed");
   Ada.Text_IO.Put(ASCII.ESC & "[2J");
   delay 2.0;



   --output starting status for sub
   Put_Line("System Boot Report");
   Put_Line("Depth: " & Uboat.Depth'Image);
   Put_Line("Surface Level: " & Uboat.SurfaceLevel'Image);
   Put_Line("Door one " &Airlock(1).DoorStatus'Image & " and " & Airlock(1).LockStatus'Image);
   Put_Line("Door two " &Airlock(2).DoorStatus'Image & " and " & Airlock(2).LockStatus'Image);
   Put_Line("Oxygen Level: " & Otank.OxyLevel'Image);
   Put_Line("Reactor Temp: " & ReactorCore.CurrentTemp'Image);

    delay 5.0;
     Ada.Text_IO.Put(ASCII.ESC & "[2J");
   Put_Line(".");
   delay 0.1;
   Ada.Text_IO.Put(ASCII.ESC & "[2J");
   Put_Line("..");
    delay 0.1;
   Ada.Text_IO.Put(ASCII.ESC & "[2J");
   Put_Line("...");
    delay 0.1;
   Ada.Text_IO.Put(ASCII.ESC & "[2J");
   Put_Line("....");
    delay 0.1;
   Ada.Text_IO.Put(ASCII.ESC & "[2J");
   Put_Line(".....");
    delay 0.1;
   Ada.Text_IO.Put(ASCII.ESC & "[2J");
   Put_Line(".......");
    delay 0.1;
   Ada.Text_IO.Put(ASCII.ESC & "[2J");
   Put_Line(".........");
    delay 0.1;
   Ada.Text_IO.Put(ASCII.ESC & "[2J");
   Put_Line("...........");
    delay 0.1;
   Ada.Text_IO.Put(ASCII.ESC & "[2J");
    delay 0.1;
   Put_Line("...............");
   delay 0.1;
   Ada.Text_IO.Put(ASCII.ESC & "[2J");

   --opens door
   OpenDoor(AirLock,Uboat,1);
   Put_Line("System Report Open Door");
   Put_Line("Depth: " & Uboat.Depth'Image);
   Put_Line("Surface Level: " & Uboat.SurfaceLevel'Image);
   Put_Line("Door one " &Airlock(1).DoorStatus'Image & " and " & Airlock(1).LockStatus'Image);
   Put_Line("Door two " &Airlock(2).DoorStatus'Image & " and " & Airlock(2).LockStatus'Image);
   Put_Line("Oxygen Level: " & Otank.OxyLevel'Image);
   Put_Line("Reactor Temp: " & ReactorCore.CurrentTemp'Image);

   delay 5.0;
   Ada.Text_IO.Put(ASCII.ESC & "[2J");
   Put_Line(".");
   delay 0.1;
   Ada.Text_IO.Put(ASCII.ESC & "[2J");
   Put_Line("..");
    delay 0.1;
   Ada.Text_IO.Put(ASCII.ESC & "[2J");
   Put_Line("...");
    delay 0.1;
   Ada.Text_IO.Put(ASCII.ESC & "[2J");
   Put_Line("....");
    delay 0.1;
   Ada.Text_IO.Put(ASCII.ESC & "[2J");
   Put_Line(".....");
    delay 0.1;
   Ada.Text_IO.Put(ASCII.ESC & "[2J");
   Put_Line(".......");
    delay 0.1;
   Ada.Text_IO.Put(ASCII.ESC & "[2J");
   Put_Line(".........");
    delay 0.1;
   Ada.Text_IO.Put(ASCII.ESC & "[2J");
   Put_Line("...........");
    delay 0.1;
   Ada.Text_IO.Put(ASCII.ESC & "[2J");
    delay 0.1;
   Put_Line("...............");
   delay 0.1;
   Ada.Text_IO.Put(ASCII.ESC & "[2J");

   --trys to dive while door open
   Ada.Text_IO.Put(ASCII.ESC & "[2J");
   Dive(AirLock,Uboat,400,Otank,ReactorCore);
   Put_Line("System Report Dive");
   Put_Line("Depth: " & Uboat.Depth'Image);
   Put_Line("Surface Level: " & Uboat.SurfaceLevel'Image);
   Put_Line("Door one " &Airlock(1).DoorStatus'Image & " and " & Airlock(1).LockStatus'Image);
   Put_Line("Door two " &Airlock(2).DoorStatus'Image & " and " & Airlock(2).LockStatus'Image);
   Put_Line("Oxygen Level: " & Otank.OxyLevel'Image);
   Put_Line("Reactor Temp: " & ReactorCore.CurrentTemp'Image);

    delay 5.0;
     Ada.Text_IO.Put(ASCII.ESC & "[2J");
   Put_Line(".");
   delay 0.1;
   Ada.Text_IO.Put(ASCII.ESC & "[2J");
   Put_Line("..");
    delay 0.1;
   Ada.Text_IO.Put(ASCII.ESC & "[2J");
   Put_Line("...");
    delay 0.1;
   Ada.Text_IO.Put(ASCII.ESC & "[2J");
   Put_Line("....");
    delay 0.1;
   Ada.Text_IO.Put(ASCII.ESC & "[2J");
   Put_Line(".....");
    delay 0.1;
   Ada.Text_IO.Put(ASCII.ESC & "[2J");
   Put_Line(".......");
    delay 0.1;
   Ada.Text_IO.Put(ASCII.ESC & "[2J");
   Put_Line(".........");
    delay 0.1;
   Ada.Text_IO.Put(ASCII.ESC & "[2J");
   Put_Line("...........");
    delay 0.1;
   Ada.Text_IO.Put(ASCII.ESC & "[2J");
    delay 0.1;
   Put_Line("...............");
   delay 0.1;

   --Closes open door
   Ada.Text_IO.Put(ASCII.ESC & "[2J");
   Put_Line("Closing and Locking Door...........");
   CloseDoor(AirLock,Uboat,1);

   delay 5.0;
   Ada.Text_IO.Put(ASCII.ESC & "[2J");
   Put_Line(".");
   delay 0.1;
   Ada.Text_IO.Put(ASCII.ESC & "[2J");
   Put_Line("..");
    delay 0.1;
   Ada.Text_IO.Put(ASCII.ESC & "[2J");
   Put_Line("...");
    delay 0.1;
   Ada.Text_IO.Put(ASCII.ESC & "[2J");
   Put_Line("....");
    delay 0.1;
   Ada.Text_IO.Put(ASCII.ESC & "[2J");
   Put_Line(".....");
    delay 0.1;
   Ada.Text_IO.Put(ASCII.ESC & "[2J");
   Put_Line(".......");
    delay 0.1;
   Ada.Text_IO.Put(ASCII.ESC & "[2J");
   Put_Line(".........");
    delay 0.1;
   Ada.Text_IO.Put(ASCII.ESC & "[2J");
   Put_Line("...........");
    delay 0.1;
   Ada.Text_IO.Put(ASCII.ESC & "[2J");
    delay 0.1;
   Put_Line("...............");
   delay 0.1;
   Ada.Text_IO.Put(ASCII.ESC & "[2J");

   --gives system update after closing door
   Put_Line("System Update");
   Put_Line("Depth: " & Uboat.Depth'Image);
   Put_Line("Surface Level: " & Uboat.SurfaceLevel'Image);
   Put_Line("Door one " &Airlock(1).DoorStatus'Image & " and " & Airlock(1).LockStatus'Image);
   Put_Line("Door two " &Airlock(2).DoorStatus'Image & " and " & Airlock(2).LockStatus'Image);
   Put_Line("Oxygen Level: " & Otank.OxyLevel'Image);
   Put_Line("Reactor Temp: " & ReactorCore.CurrentTemp'Image);

      delay 5.0;
     Ada.Text_IO.Put(ASCII.ESC & "[2J");
   Put_Line(".");
   delay 0.1;
   Ada.Text_IO.Put(ASCII.ESC & "[2J");
   Put_Line("..");
    delay 0.1;
   Ada.Text_IO.Put(ASCII.ESC & "[2J");
   Put_Line("...");
    delay 0.1;
   Ada.Text_IO.Put(ASCII.ESC & "[2J");
   Put_Line("....");
    delay 0.1;
   Ada.Text_IO.Put(ASCII.ESC & "[2J");
   Put_Line(".....");
    delay 0.1;
   Ada.Text_IO.Put(ASCII.ESC & "[2J");
   Put_Line(".......");
    delay 0.1;
   Ada.Text_IO.Put(ASCII.ESC & "[2J");
   Put_Line(".........");
    delay 0.1;
   Ada.Text_IO.Put(ASCII.ESC & "[2J");
   Put_Line("...........");
    delay 0.1;
   Ada.Text_IO.Put(ASCII.ESC & "[2J");
    delay 0.1;
   Put_Line("...............");
   delay 0.1;
   Ada.Text_IO.Put(ASCII.ESC & "[2J");

   -- trys to dive with both doors closed.
   Ada.Text_IO.Put(ASCII.ESC & "[2J");
   Dive(Airlock,Uboat,400,Otank,ReactorCore);
   Put_Line("System Report Dive");
   Put_Line("Depth: " & Uboat.Depth'Image);
   Put_Line("Surface Level: " & Uboat.SurfaceLevel'Image);
   Put_Line("Door one " &Airlock(1).DoorStatus'Image & " and " & Airlock(1).LockStatus'Image);
   Put_Line("Door two " &Airlock(2).DoorStatus'Image & " and " & Airlock(2).LockStatus'Image);
   Put_Line("Oxygen Level: " & Otank.OxyLevel'Image);
   Put_Line("Reactor Temp: " & ReactorCore.CurrentTemp'Image);

      delay 5.0;

     Ada.Text_IO.Put(ASCII.ESC & "[2J");
   Put_Line(".");
   delay 0.1;
   Ada.Text_IO.Put(ASCII.ESC & "[2J");
   Put_Line("..");
    delay 0.1;
   Ada.Text_IO.Put(ASCII.ESC & "[2J");
   Put_Line("...");
    delay 0.1;
   Ada.Text_IO.Put(ASCII.ESC & "[2J");
   Put_Line("....");
    delay 0.1;
   Ada.Text_IO.Put(ASCII.ESC & "[2J");
   Put_Line(".....");
    delay 0.1;
   Ada.Text_IO.Put(ASCII.ESC & "[2J");
   Put_Line(".......");
    delay 0.1;
   Ada.Text_IO.Put(ASCII.ESC & "[2J");
   Put_Line(".........");
    delay 0.1;
   Ada.Text_IO.Put(ASCII.ESC & "[2J");
   Put_Line("...........");
    delay 0.1;
   Ada.Text_IO.Put(ASCII.ESC & "[2J");
    delay 0.1;
   Put_Line("...............");
   delay 0.1;
   Ada.Text_IO.Put(ASCII.ESC & "[2J");
   delay 1.0;

   -- reactor ok below the surface
  Ada.Text_IO.Put(ASCII.ESC & "[2J");
   ReactorSurface(ReactorCore,Uboat,99);
    Put_Line("System Report Reactor");
   Put_Line("Depth: " & Uboat.Depth'Image);
   Put_Line("Surface Level: " & Uboat.SurfaceLevel'Image);
   Put_Line("Door one " &Airlock(1).DoorStatus'Image & " and " & Airlock(1).LockStatus'Image);
   Put_Line("Door two " &Airlock(2).DoorStatus'Image & " and " & Airlock(2).LockStatus'Image);
   Put_Line("Oxygen Level: " & Otank.OxyLevel'Image);
   Put_Line("Reactor Temp: " & ReactorCore.CurrentTemp'Image);

   delay 5.0;

   --reactor overheats and surfaces
   Ada.Text_IO.Put(ASCII.ESC & "[2J");
   Put_Line("Reactor Overheating.....................");
   delay 2.0;
   Ada.Text_IO.Put(ASCII.ESC & "[2J");
   Put_Line("Auto Pilot Engaged Overheating Reactor.....................");
   ReactorSurface(ReactorCore,Uboat,101);
   delay 1.0;
   Put_Line("System Report Reactor");
   Put_Line("Depth: " & Uboat.Depth'Image);
   Put_Line("Surface Level: " & Uboat.SurfaceLevel'Image);
   Put_Line("Door one " &Airlock(1).DoorStatus'Image & " and " & Airlock(1).LockStatus'Image);
   Put_Line("Door two " &Airlock(2).DoorStatus'Image & " and " & Airlock(2).LockStatus'Image);
   Put_Line("Oxygen Level: " & Otank.OxyLevel'Image);
   Put_Line("Reactor Temp: " & ReactorCore.CurrentTemp'Image);

   delay 5.0;
   Ada.Text_IO.Put(ASCII.ESC & "[2J");
   Put_Line("Reactor Cooling .....................");
      delay 2.0;
     Ada.Text_IO.Put(ASCII.ESC & "[2J");
   Put_Line(".");
   delay 0.1;
   Ada.Text_IO.Put(ASCII.ESC & "[2J");
   Put_Line("..");
    delay 0.1;
   Ada.Text_IO.Put(ASCII.ESC & "[2J");
   Put_Line("...");
    delay 0.1;
   Ada.Text_IO.Put(ASCII.ESC & "[2J");
   Put_Line("....");
    delay 0.1;
   Ada.Text_IO.Put(ASCII.ESC & "[2J");
   Put_Line(".....");
    delay 0.1;
   Ada.Text_IO.Put(ASCII.ESC & "[2J");
   Put_Line(".......");
    delay 0.1;
   Ada.Text_IO.Put(ASCII.ESC & "[2J");
   Put_Line(".........");
    delay 0.1;
   Ada.Text_IO.Put(ASCII.ESC & "[2J");
   Put_Line("...........");
    delay 0.1;
   Ada.Text_IO.Put(ASCII.ESC & "[2J");
    delay 0.1;
   Put_Line("...............");
   delay 0.1;
   Ada.Text_IO.Put(ASCII.ESC & "[2J");
   delay 1.0;

   -- changes oxygen level to below safe levels and trys to dive
   ReactorCore.CurrentTemp := 90;
   Otank.OxyLevel := 20;
   Put_Line("System Report Reactor");
   Put_Line("Depth: " & Uboat.Depth'Image);
   Put_Line("Surface Level: " & Uboat.SurfaceLevel'Image);
   Put_Line("Door one " &Airlock(1).DoorStatus'Image & " and " & Airlock(1).LockStatus'Image);
   Put_Line("Door two " &Airlock(2).DoorStatus'Image & " and " & Airlock(2).LockStatus'Image);
   Put_Line("Oxygen Level: " & Otank.OxyLevel'Image);
   Put_Line("Reactor Temp: " & ReactorCore.CurrentTemp'Image);

   delay 5.0;
      delay 2.0;
     Ada.Text_IO.Put(ASCII.ESC & "[2J");
   Put_Line(".");
   delay 0.1;
   Ada.Text_IO.Put(ASCII.ESC & "[2J");
   Put_Line("..");
    delay 0.1;
   Ada.Text_IO.Put(ASCII.ESC & "[2J");
   Put_Line("...");
    delay 0.1;
   Ada.Text_IO.Put(ASCII.ESC & "[2J");
   Put_Line("....");
    delay 0.1;
   Ada.Text_IO.Put(ASCII.ESC & "[2J");
   Put_Line(".....");
    delay 0.1;
   Ada.Text_IO.Put(ASCII.ESC & "[2J");
   Put_Line(".......");
    delay 0.1;
   Ada.Text_IO.Put(ASCII.ESC & "[2J");
   Put_Line(".........");
    delay 0.1;
   Ada.Text_IO.Put(ASCII.ESC & "[2J");
   Put_Line("...........");
    delay 0.1;
   Ada.Text_IO.Put(ASCII.ESC & "[2J");
    delay 0.1;
   Put_Line("...............");
   delay 0.1;
   Ada.Text_IO.Put(ASCII.ESC & "[2J");
   delay 5.0;

   Dive(AirLock,Uboat,400,Otank,ReactorCore);

   Put_Line("System Report Reactor");
   Put_Line("Depth: " & Uboat.Depth'Image);
   Put_Line("Surface Level: " & Uboat.SurfaceLevel'Image);
   Put_Line("Door one " &Airlock(1).DoorStatus'Image & " and " & Airlock(1).LockStatus'Image);
   Put_Line("Door two " &Airlock(2).DoorStatus'Image & " and " & Airlock(2).LockStatus'Image);
   Put_Line("Oxygen Level: " & Otank.OxyLevel'Image);
   Put_Line("Reactor Temp: " & ReactorCore.CurrentTemp'Image);

   Ada.Text_IO.Put(ASCII.ESC & "[2J");
    Put_Line("looky looky ");
   Put_Line("Torpedo Rack");
   Put_Line(tor(1)'Image);
   Put_Line(tor(2)'Image);
   Put_Line(tor(3)'Image);
   Put_Line(tor(4)'Image);
   Put_Line(tor(5)'Image);
   Put_Line("Torpedo Bay");
   Put_Line(torT(1)'Image);
   Put_Line(torT(2)'Image);
   Put_Line(torT(3)'Image);
   Put_Line(torT(4)'Image);
   Put_Line(torT(5)'Image);
   delay 2.0;
   Ada.Text_IO.Put(ASCII.ESC & "[2J");
   Put_Line("storing torpedos in rack");
   StoreTorpedos(tor, Uboat, Airlock);
   Put_Line(tor(1)'Image);
   Put_Line(tor(2)'Image);
   Put_Line(tor(3)'Image);
   Put_Line(tor(4)'Image);
   Put_Line(tor(5)'Image);
   Put_Line(torT(1)'Image);
   Put_Line(torT(2)'Image);
   Put_Line(torT(3)'Image);
   Put_Line(torT(4)'Image);
   Put_Line(torT(5)'Image);
   delay 2.0;
   Ada.Text_IO.Put(ASCII.ESC & "[2J");
   Put_Line("transfering torpedos from rack to torpedo tube ");
   LoadTorpedos(tor,torT,Airlock,slot);
     Put_Line(tor(1)'Image);
   Put_Line(tor(2)'Image);
   Put_Line(tor(3)'Image);
   Put_Line(tor(4)'Image);
   Put_Line(tor(5)'Image);
   Put_Line(torT(1)'Image);
   Put_Line(torT(2)'Image);
   Put_Line(torT(3)'Image);
   Put_Line(torT(4)'Image);
   Put_Line(torT(5)'Image);
   Ada.Text_IO.Put(ASCII.ESC & "[2J");
   Put_Line("Fire torpedos");
   FireTorpedos(torT,Uboat, Airlock,slot);
   Put_Line(tor(1)'Image);
   Put_Line(tor(2)'Image);
   Put_Line(tor(3)'Image);
   Put_Line(tor(4)'Image);
   Put_Line(tor(5)'Image);
   Put_Line(torT(1)'Image);
   Put_Line(torT(2)'Image);
   Put_Line(torT(3)'Image);
   Put_Line(torT(4)'Image);
   Put_Line(torT(5)'Image);

   delay 2.0;
   delay 2.0;





end Main;
