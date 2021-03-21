# https://leetcode.com/explore/challenge/card/march-leetcoding-challenge-2021/590/week-3-march-15th-march-21st/3678/
# Design Underground System
# Implement the UndergroundSystem class:

# void check_in(int id, string stationName, int t)
# A customer with a card id equal to id, gets in the station stationName at time t.
# A customer can only be checked into one place at a time.
# void check_out(int id, string stationName, int t)
# A customer with a card id equal to id, gets out from the station stationName at time t.
# double get_average_time(string startStation, string endStation)
# Returns the average time to travel between the startStation and the endStation.
# The average time is computed from all the previous traveling from startStation to endStation that happened directly.
# Call to get_average_time is always valid.
# You can assume all calls to check_in and check_out methods are consistent. If a customer gets in at time t1 at some station, they get out at time t2 with t2 > t1. All events happen in chronological order.

class UndergroundSystem
  def initialize()
    @averages = Hash.new { |h,k| h[k] = Array.new(2, 0) }  # { Paradise-Waterloo: [ 10minutes, 2trips ] }
    @trips = Hash.new
  end

=begin
  :type id: Integer
  :type station_name: String
  :type t: Integer
  :rtype: Void
=end
  def check_in(id, start_station, start_time)
    @trips[id] = [start_station, start_time]
    return nil
  end


=begin
  :type id: Integer
  :type station_name: String
  :type t: Integer
  :rtype: Void
=end
  def check_out(id, end_station, end_time)
    start_station, start_time = @trips[id]
    trip_duration = end_time - start_time
    key = "#{start_station}-#{end_station}"
    @averages[key][0] += trip_duration
    @averages[key][1] += 1
    @trips.delete(id)
    return nil
  end


=begin
  :type start_station: String
  :type end_station: String
  :rtype: Float
=end
  def get_average_time(start_station, end_station)
    key = "#{start_station}-#{end_station}"
    if @averages.include?(key)
      total_trip_time, total_trips = @averages[key]
      return (total_trip_time * 1.0) / total_trips
    end
  end
end

# Your UndergroundSystem object will be instantiated and called as such:
# obj = UndergroundSystem.new()
# obj.check_in(id, station_name, t)
# obj.check_out(id, station_name, t)
# param_3 = obj.get_average_time(start_station, end_station)

# Example 1:

# Input
obj = UndergroundSystem.new()
actions = ["UndergroundSystem","check_in","check_in","check_in","check_out","check_out","check_out","get_average_time","get_average_time","check_in","get_average_time","check_out","get_average_time"]
args = [[],[45,"Leyton",3],[32,"Paradise",8],[27,"Leyton",10],[45,"Waterloo",15],[27,"Waterloo",20],[32,"Cambridge",22],["Paradise","Cambridge"],["Leyton","Waterloo"],[10,"Leyton",24],["Leyton","Waterloo"],[10,"Waterloo",38],["Leyton","Waterloo"]]
(1...actions.size).each do |i|
  puts obj.send(actions[i], *args[i])
end
# puts obj.get_average_time("Leyton", "Waterloo")

# Output
# [null,null,null,null,null,null,null,14.00000,11.00000,null,11.00000,null,12.00000]

# Explanation
# UndergroundSystem undergroundSystem = new UndergroundSystem();
# undergroundSystem.check_in(45, "Leyton", 3);
# undergroundSystem.check_in(32, "Paradise", 8);
# undergroundSystem.check_in(27, "Leyton", 10);
# undergroundSystem.check_out(45, "Waterloo", 15);
# undergroundSystem.check_out(27, "Waterloo", 20);
# undergroundSystem.check_out(32, "Cambridge", 22);
# undergroundSystem.get_average_time("Paradise", "Cambridge");       // return 14.00000. There was only one travel from "Paradise" (at time 8) to "Cambridge" (at time 22)
# undergroundSystem.get_average_time("Leyton", "Waterloo");          // return 11.00000. There were two travels from "Leyton" to "Waterloo", a customer with id=45 from time=3 to time=15 and a customer with id=27 from time=10 to time=20. So the average time is ( (15-3) + (20-10) ) / 2 = 11.00000
# undergroundSystem.check_in(10, "Leyton", 24);
# undergroundSystem.get_average_time("Leyton", "Waterloo");          // return 11.00000
# undergroundSystem.check_out(10, "Waterloo", 38);
# undergroundSystem.get_average_time("Leyton", "Waterloo");          // return 12.00000
# Example 2:

# Input
# ["UndergroundSystem","check_in","check_out","get_average_time","check_in","check_out","get_average_time","check_in","check_out","get_average_time"]
# [[],[10,"Leyton",3],[10,"Paradise",8],["Leyton","Paradise"],[5,"Leyton",10],[5,"Paradise",16],["Leyton","Paradise"],[2,"Leyton",21],[2,"Paradise",30],["Leyton","Paradise"]]

# Output
# [null,null,null,5.00000,null,null,5.50000,null,null,6.66667]

# Explanation
# UndergroundSystem undergroundSystem = new UndergroundSystem();
# undergroundSystem.check_in(10, "Leyton", 3);
# undergroundSystem.check_out(10, "Paradise", 8);
# undergroundSystem.get_average_time("Leyton", "Paradise"); // return 5.00000
# undergroundSystem.check_in(5, "Leyton", 10);
# undergroundSystem.check_out(5, "Paradise", 16);
# undergroundSystem.get_average_time("Leyton", "Paradise"); // return 5.50000
# undergroundSystem.check_in(2, "Leyton", 21);
# undergroundSystem.check_out(2, "Paradise", 30);
# undergroundSystem.get_average_time("Leyton", "Paradise"); // return 6.66667
 

# Constraints:

# There will be at most 20000 operations.
# 1 <= id, t <= 106
# All strings consist of uppercase and lowercase English letters, and digits.
# 1 <= stationName.length <= 10
# Answers within 10-5 of the actual value will be accepted as correct.