
package Submarine with SPARK_Mode
is


   type OpenClose is (Closed, Open);
   type LockUnlock is (Locked, Unlocked);
   type Bay is (Empty, Full);
   type WarningBuzzer is (On,Off);
   type Level is (Surface, Below);

   type AL_Index is range 1..2;
   type Depth_Index is range 0..2500;
   type Bay_Index is range 1..5;


   --Door Record
   type Door is tagged record
      DoorStatus : OpenClose := Closed;
      LockStatus : LockUnlock := Locked;
   end record;

   --Sub Record


   type Sub is record
      SurfaceLevel : Level;
      OxygenWarning : WarningBuzzer;
      MaxDepth : Integer := 2500;
      Depth :Depth_Index;
      BaySelect : Bay_Index;
   end record;

  --Reactor Record
   type Reactor is record
      MaxTemp : Integer range 100..100 ;
      CurrentTemp : Integer range 0..120 := 0;
   end record;

   --Oxygen Record
   type OxygenTank is record
      OxygenWarning : Integer := 25;
      OxyLevel : Integer range 0..100 := 100;
   end record;

   type TorpedoTube is array (Bay_Index) of Bay;

   type TorpedoRack is array (Bay_Index) of Bay;

   type AirLocks is array (AL_Index) of Door;

   -- Oxygen
   procedure OxygenSurface (d : in OxygenTank; a : in out Sub) with
     Pre => (d.OxyLevel <= 0 and a.SurfaceLevel = Below),
     Post => (a.SurfaceLevel = Surface);

   procedure OxygenWarningLight (d : in OxygenTank; a : in out Sub) with
     Pre => (d.OxyLevel <= d.OxygenWarning),
     Post => (a.OxygenWarning = On);

   --Reactor
   procedure ReactorSurface (d : in Reactor; a : in out Sub; n : in Depth_Index) with
     Pre => (Standard.Integer(n) > d.MaxTemp),
     Post => (a.SurfaceLevel = Surface and a.Depth = 0);

   --Doors
   procedure OpenDoor (d : in out AirLocks; a : in Sub; n : in  AL_Index) with
     Pre =>  (for all J in d'Range => d(J).DoorStatus /= Open and d(J).LockStatus /= Unlocked) and(a.SurfaceLevel /= Below),
     Post => (d(n).DoorStatus = Open) and (d(n).LockStatus = Unlocked);

   procedure CloseDoor (d : in out AirLocks; a : in Sub; n : in  AL_Index) with
     Pre =>  (for some J in d'Range => d(J).DoorStatus /= Closed and d(J).LockStatus /= locked) and(a.SurfaceLevel /= Below),
     Post => (d(n).DoorStatus = Closed) and (d(n).LockStatus = Locked);

   -- Sub
   procedure Dive (d : in AirLocks; a : in out Sub; n : in Depth_Index; t : in OxygenTank; r : in Reactor) with
     Pre => (for all J in d'Range => d(J).DoorStatus /= Open and d(J).LockStatus /= Unlocked) and (t.OxyLevel > t.OxygenWarning) and (r.CurrentTemp < r.MaxTemp),
     Post => (Standard.Integer(a.Depth) <= Standard.Integer(a.MaxDepth));

   function Loadready(d : in  AirLocks;n: in AL_Index) return Boolean with
     Pre => (for all I in d'Range => d(I).DoorStatus = Closed and d(I).LockStatus = Locked),
     Post => Loadready'Result;

   procedure StoreTorpedos(d: in out TorpedoRack; a : in out Sub; c : in   AirLocks) with
     Pre => (for all J in c'Range => c(J).DoorStatus = Closed and c(J).LockStatus = Locked) and (a.SurfaceLevel = Surface),
     Post => (for all I in d'Range => d(I) = Full);

   procedure LoadTorpedos(d: in out TorpedoRack; t: in out TorpedoTube;  c : in   AirLocks; j: in out Bay) with
     Pre => (for all J in c'Range => c(J).DoorStatus = Closed and c(J).LockStatus = Locked),
     Post => (CountSpaceRack(d,j) <= CountSpaceRack(d,j'Old));

   procedure FireTorpedos(t: in out TorpedoTube; a : in Sub; c : in AirLocks; j: in out Bay) with
     Pre => (for all J in c'Range => c(J).DoorStatus = Closed and c(J).LockStatus = Locked) and (a.SurfaceLevel = Surface),
     Post => (CountSpaceTube(t,j) <= CountSpaceTube(t,j'Old));

   function CountSpaceRack(d : TorpedoRack; b : Bay) return Integer with
     Post => CountSpaceRack'Result >= 0 and CountSpaceRack'Result <= d'Length;

    function CountSpaceTube(d : TorpedoTube; b : Bay) return Integer with
    Post => CountSpaceTube'Result >= 0 and CountSpaceTube'Result <= d'Length;












end Submarine;
