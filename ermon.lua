--setup the monitor
display=peripheral.wrap("monitor_0")
 
--set up wrappers for each tank
tanks={}
resevoirs={"tt_aspectContainer_0","tt_aspectContainer_1","tt_aspectContainer_2"}
for k,v in pairs(resevoirs) do
   tanks[k] = peripheral.wrap(v)
end
 
function measureTanks()
local essentia = {}
   for k,tank in pairs(tanks) do
      for o,aspect in pairs(tank.getAspects()) do
         if essentia[aspect]==nil then
            essentia[aspect]=0
         end
         essentia[aspect] = essentia[aspect] + tank.getAspectCount(aspect)
      end
   end
   return essentia
end
 
function printHeader()
   display.clear()
   display.setCursorPos(1,1)
   display.setTextColor(colors.blue)
   display.write("Essentia Resevoir Monitor 1.0")
end
 
function printData(data)
  print("printData Entered ")
  display.setTextColor(colors.white)
  myrow=2
  display.setCursorPos(1,2)
  for ess,val in pairs(data) do
      label=string.sub(ess, 1, 3)
      print(" datas : "..label..": "..val)
      display.write(label..": "..val)
      myrow=myrow+1
      display.setCursorPos(1,myrow)
   end
end
 
while true do
   data=measureTanks()
   printHeader()
   printData(data)
   sleep(1)
end
