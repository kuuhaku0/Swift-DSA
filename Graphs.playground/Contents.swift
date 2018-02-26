//: Playground - noun: a place where people can play

import Cocoa
// VERTEX
public struct Vertex<T: Hashable> {
    var data: T
}

extension Vertex: Hashable {
    public var hashValue: Int {
        return "\(data)".hashValue
    }
    
    static public func ==(lhs: Vertex, rhs: Vertex) -> Bool {
        return lhs.data == rhs.data
    }
}

extension Vertex: CustomStringConvertible {
    public var description: String {
        return "\(data)"
    }
}

// EDGE
public enum EdgeType {
    case directed, undirected
}

public struct Edge<T: Hashable> {
    public var source: Vertex<T>
    public var destination: Vertex<T>
    public var weight: Double?
}

extension Edge: Hashable {
    public var hashValue: Int {
        return "\(source)\(destination)\(weight ?? 0)".hashValue
    }
    
    static public func ==(lhs: Edge<T>, rhs: Edge<T>) -> Bool {
        return lhs.source == rhs.source &&
        lhs.destination == rhs.destination &&
        lhs.weight == rhs.weight
    }
}

protocol Graphable {
    associatedtype Element: Hashable
    var description: CustomStringConvertible {get}
    
    func createVertex(data: Element) -> Vertex<Element>
    func add(_ type: EdgeType, from source: Vertex<Element>, to destination: Vertex<Element>, weight: Double?)
    func weight(from source: Vertex<Element>, to destination: Vertex<Element>) -> Double?
    func edges(from source: Vertex<Element>) ->[Edge<Element>]?
    
}

open class AdjacencyList<T: Hashable> {
    public var adjacencyDict: [Vertex<T>: [Edge<T>]] = [:]
    public init() {}
    
    fileprivate func addDirectedEdge(from source: Vertex<Element>, to destination: Vertex<Element>, weight: Double?) {
        let edge = Edge(source: source, destination: destination, weight: weight)
        adjacencyDict[source]?.append(edge)
    }
    fileprivate func addUndirectedEdge(verticies: (Vertex<Element>, Vertex<Element>), weight: Double?)  {
        let (source, destination) = verticies
        addDirectedEdge(from: source, to: destination, weight: weight)
        addDirectedEdge(from: destination, to: source, weight: weight)
    }
    
}

extension AdjacencyList: Graphable {
    public typealias Element = T
    
    public func createVertex(data: Element) -> Vertex<Element> {
        let vertex = Vertex(data: data)
        
        if adjacencyDict[vertex] == nil {
            adjacencyDict[vertex] = []
        }
        return vertex
    }
    
    public func add(_ type: EdgeType, from source: Vertex<T>, to destination: Vertex<T>, weight: Double?) {
        switch type {
        case .directed:
            addDirectedEdge(from: source, to: destination, weight: weight)
        case .undirected:
            addUndirectedEdge(verticies: (source, destination), weight: weight)
        }
    }
    
    public func weight(from source: Vertex<T>, to destination: Vertex<T>) -> Double? {
        guard let edges = adjacencyDict[source] else {
            return nil
        }
        for edge in edges {
            if edge.destination == destination {
                return edge.weight
            }
        }
        return nil
    }
    
    public func edges(from source: Vertex<T>) -> [Edge<T>]? {
        return adjacencyDict[source]
    }
    
    public var description: CustomStringConvertible {
        var result = ""
        for (vertex, edges) in adjacencyDict {
            var edgeString = ""
            for (index, edge) in edges.enumerated() {
                if index != edges.count - 1 {
                    edgeString.append("\(edge.destination), ")
                } else {
                    edgeString.append("\(edge.destination)")
                }
            }
            result.append("\(vertex) ---> [ \(edgeString) ] \n ")
        }
        return result
    }
}

let aList = AdjacencyList<String>()
let v1 = aList.createVertex(data: "v1")
let v2 = aList.createVertex(data: "v2")
let v3 = aList.createVertex(data: "v3")
let v4 = aList.createVertex(data: "v4")

aList.add(.undirected, from: v1, to: v2, weight: 1.2)
aList.addUndirectedEdge(verticies: (v1,v4), weight: 1.4)
aList.weight(from: v1, to: v2)
aList.edges(from: v1)
aList.addDirectedEdge(from: v3, to: v2, weight: 1)
print(aList.description)



