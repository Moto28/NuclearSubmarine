package body Submarine with SPARK_mode
is



   procedure OxygenSurface (d : in OxygenTank; a : in out Sub) is
   begin
      if d.OxyLevel <= 0 then
         a.SurfaceLevel := Surface;
      end if;

   end OxygenSurface;

   procedure OxygenWarningLight (d : in OxygenTank; a : in out Sub) is
   begin
      if d.OxyLevel <= d.OxygenWarning then
         a.OxygenWarning := On;
      end if;

   end OxygenWarningLight;

   procedure ReactorSurface (d : in Reactor; a : in out Sub; n : in Depth_Index ) is
   begin
      if Standard.Integer(n) > d.MaxTemp then
         a.SurfaceLevel := Surface;
         a.Depth := 0;
      end if;

   end ReactorSurface;

   procedure OpenDoor (d : in out AirLocks; a: in Sub; n : in  AL_Index) is
   begin


      while n <= d'Last loop
         if n < d'Last then
            --checks if any doors are opened and unlocked
            if (d(n).DoorStatus = Open and d(n).LockStatus = Unlocked) or (d(n+1).DoorStatus = Open and d(n+1).LockStatus = Unlocked ) then

               exit;

            elsif (d(n+1).DoorStatus = Closed and d(n+1).LockStatus = Locked) then
               if a.SurfaceLevel = Surface then
                  d(n).LockStatus := Unlocked;
                  d(n).DoorStatus := Open;
               end if;
               exit;

            elsif n = d'Last then
               if (d(n).DoorStatus = Open and d(n).LockStatus = Unlocked) or (d(n-1).DoorStatus = Open and d(n-1).LockStatus = Unlocked) then

                  exit;

               elsif (d(n-1).DoorStatus = Closed and d(n-1).LockStatus = Locked) then
                  if a.SurfaceLevel = Surface then
                     d(n).LockStatus := Unlocked;
                     d(n).DoorStatus := Open;
                  end if;
                  exit;
               end if;
            end if;

         end if;
      end loop;

   end OpenDoor;

   procedure CloseDoor (d : in out AirLocks; a : in Sub; n: in AL_Index) is
   begin

      while n <= d'Last loop
         --checks if any doors are opened and unlocked
         if (d(n).DoorStatus = Open and d(n).LockStatus = Unlocked) then

            d(n).DoorStatus := Closed;
            d(n).LockStatus := Locked;

         end if;
      end loop;

   end CloseDoor;

   procedure Dive (d : in AirLocks; a : in out Sub; n : in Depth_Index; t : in  OxygenTank; r : in Reactor) is
   begin

      if (d(1).DoorStatus = Closed and d(1).LockStatus = Locked) and (d(2).DoorStatus = Closed and d(2).LockStatus = Locked) and
        (t.OxyLevel > t.OxygenWarning) and (r.CurrentTemp < r.MaxTemp) and Standard.Integer(n) < Standard.Integer(a.MaxDepth) and n > 0 then

         a.Depth := n;
         a.SurfaceLevel := Below;

      end if;


   end Dive;

   function Loadready (d : in AirLocks; n: in AL_Index) return Boolean
   is
   begin

      while n <= d'Last loop

         if n < d'Last then
            --checks if any doors are opened and unlocked
            if (d(n).DoorStatus = Closed and d(n).LockStatus = Locked ) or ((d(n+1).DoorStatus = Closed and d(n+1).LockStatus = Locked)) then

               return True;

            elsif n = d'Last then
               if (d(n).DoorStatus = Closed and d(n).LockStatus = Locked) or ((d(n-1).DoorStatus = Closed and d(n-1).LockStatus = Locked)) then

                  return True;

               end if;

            end if;


         end if;

      end loop;
      return False;

   end Loadready;

   procedure StoreTorpedos (d: in out TorpedoRack; a : in out Sub; c : in  AirLocks) is
      u : Bay_Index := d'First;
      z: Bay_Index := d'Last;
   begin


      if (c(c'First).DoorStatus = Closed and c(c'First).LockStatus = Locked) and (c(c'Last).DoorStatus = Closed and c(c'Last).LockStatus = Locked) then
         for I in u..z loop

            if d(I) = Empty then a.BaySelect := u+ z -1; d(I):= Full; else d(I) := Full;
            end if;

         end loop;
      end if;


   end StoreTorpedos;

   procedure LoadTorpedos (d: in out TorpedoRack;t: in out TorpedoTube; c : in  AirLocks; j: in out Bay) is
      u : Bay_Index := d'First;
      z: Bay_Index  := d'Last;
   begin

      if (c(c'First).DoorStatus = Closed and c(c'First).LockStatus = Locked) and (c(c'Last).DoorStatus = Closed and c(c'Last).LockStatus = Locked) then
         for I in u..z loop

         if d(I) = Full and t(I) = Empty then t(i) := Full; d(I) := Empty;

            end if;

         end loop;
      end if;



   end LoadTorpedos;

      procedure FireTorpedos (t: in out TorpedoTube; a : in Sub; c : in AirLocks; j: in out Bay) is
         u : Bay_Index := t'First;
         z: Bay_Index := t'Last;
      begin

      if (c(c'First).DoorStatus = Closed and c(c'First).LockStatus = Locked) and (c(c'Last).DoorStatus = Closed and c(c'Last).LockStatus = Locked) and (a.SurfaceLevel = Surface) then
         for I in u..z loop

            if t(I) = Full then t(i) := Empty;
            end if;
         end loop;
         end if;

      end FireTorpedos;

   function CountSpaceRack(D : TorpedoRack; b : Bay) return Integer is
      tc : Integer := 0;
      n : Bay_Index := d'First;
      m : Bay_Index := d'Last;
   begin
      for I in n..m loop
         if d(I) = b then tc := tc +1; else tc := tc; end if;
      end loop;
      return tc;

   end CountSpaceRack;

    function CountSpaceTube(D : TorpedoTube; b : Bay) return Integer is
      tc : Integer := 0;
      n : Bay_Index := d'First;
      m : Bay_Index := d'Last;
   begin
      for I in n..m loop
         if d(I) = b then tc := tc +1; else tc := tc; end if;
      end loop;
      return tc;

   end CountSpaceTube;
end Submarine;
