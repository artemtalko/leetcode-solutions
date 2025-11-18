//
//  706. Design HashMap.swift
//  leetcode
//
//  Created by Artem on 09.11.2025.
//

/*
 Design a HashMap without using any built-in hash table libraries.

 Implement the MyHashMap class:

 MyHashMap() initializes the object with an empty map.
 void put(int key, int value) inserts a (key, value) pair into the HashMap. If the key already exists in the map, update the corresponding value.
 int get(int key) returns the value to which the specified key is mapped, or -1 if this map contains no mapping for the key.
 void remove(key) removes the key and its corresponding value if the map contains the mapping for the key.


 Example 1:

 Input
 ["MyHashMap", "put", "put", "get", "get", "put", "get", "remove", "get"]
 [[], [1, 1], [2, 2], [1], [3], [2, 1], [2], [2], [2]]
 Output
 [null, null, null, 1, -1, null, 1, null, -1]

 Explanation
 MyHashMap myHashMap = new MyHashMap();
 myHashMap.put(1, 1); // The map is now [[1,1]]
 myHashMap.put(2, 2); // The map is now [[1,1], [2,2]]
 myHashMap.get(1);    // return 1, The map is now [[1,1], [2,2]]
 myHashMap.get(3);    // return -1 (i.e., not found), The map is now [[1,1], [2,2]]
 myHashMap.put(2, 1); // The map is now [[1,1], [2,1]] (i.e., update the existing value)
 myHashMap.get(2);    // return 1, The map is now [[1,1], [2,1]]
 myHashMap.remove(2); // remove the mapping for 2, The map is now [[1,1]]
 myHashMap.get(2);    // return -1 (i.e., not found), The map is now [[1,1]]

 */


class MyHashMap {
    var mappedHash = Array(repeating: [(key: Int, value: Int)](), count: 10)

    init() {}

    func put(_ key: Int, _ value: Int) {
        let index = key % 10
        if let i = mappedHash[index].firstIndex(where: { $0.key == key }) {
            mappedHash[index][i].value = value
        } else {
            mappedHash[index].append((key: key, value: value))
        }
    }

    func get(_ key: Int) -> Int {
        let index = key % 10
        return mappedHash[index].first(where: { $0.key == key })?.value ?? -1
    }

    func remove(_ key: Int) {
        let index = key % 10
        if let i = mappedHash[index].firstIndex(where: { $0.key == key }) {
            mappedHash[index].remove(at: i)
        }
    }
}

/**
 * Your MyHashMap object will be instantiated and called as such:
 * let obj = MyHashMap()
 * obj.put(key, value)
 * let ret_2: Int = obj.get(key)
 * obj.remove(key)
 */
