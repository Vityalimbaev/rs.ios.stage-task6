import Foundation

class CoronaClass {
    var seats = [Int]()
    var n: Int
    
    init(n: Int) { self.n = n }
     
    func seat() -> Int {
        if seats.isEmpty || seats[0] != 0 {
            seats.insert(0, at: 0)
            return 0
        } else if !seats.contains(n - 1) {
            seats.append(n - 1)
            return n - 1
        }
        
        var maxDistance = 0
        var bounds: (Int?, Int?)
        
        for (n, _) in seats.enumerated() {
            if n == 0 { continue }
            let distance = seats[n] - seats[n - 1]
            if (distance % 2 == 0 && distance > maxDistance) || distance % 2 != 0 && distance - 1 > maxDistance {
                
                bounds.0 = seats[n - 1]
                bounds.1 = seats[n]
                maxDistance = distance
            }
        }
        
        let result = bounds.0! + (bounds.1! - bounds.0!) / 2
        
        for i in seats {
            if i == result {
                var freeSeat = 0
                while freeSeat != n - 1 {
                    freeSeat += 1
                    if !seats.contains(freeSeat) {
                        self.seats.append(freeSeat)
                        self.seats.sort()
                        return freeSeat
                    }
                }
            }
        }
        
        self.seats.append(result)
        self.seats.sort()
        return result
    }
     
    func leave(_ p: Int) {
        seats.remove(at: seats.firstIndex(of: p)!)
    }
}
