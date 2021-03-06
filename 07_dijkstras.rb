# the graph
graph = {}
graph['start'] = {}
graph['start']['a'] = 6
graph['start']['b'] = 2

graph['a'] = {}
graph['a']['fin'] = 1

graph['b'] = {}
graph['b']['a'] = 3
graph['b']['fin'] = 5

graph['fin'] = {}

# the costs table
costs = {}
costs['a'] = 6
costs['b'] = 2
costs['fin'] = Float::INFINITY

# the parents table
parents = {}
parents['a'] = 'start'
parents['b'] = 'start'
parents['fin'] = nil

@processed = []

def find_lowest_cost_node(costs)
  lowest_cost = Float::INFINITY
  lowest_cost_node = nil
  # Go through each node.
  costs.each do |node, cost|
    # If it's the lowest cost so far and hasn't been processed yet...
    # next unless cost < lowest_cost && !@processed.member?(node)
    next unless cost < lowest_cost && !@processed.member?(node)
    # ... set it as the new lowest-cost node.
    lowest_cost = cost
    lowest_cost_node = node
  end
  lowest_cost_node
end

# Find the lowest-cost node that you haven't processed yet.
node = find_lowest_cost_node(costs)
# If you've processed all the nodes, this while loop is done.
until node.nil?
  cost = costs[node]
  # Go through all the neighbors of this node.
  neighbors = graph[node]
  neighbors.keys.each do |n|
    new_cost = cost + neighbors[n]
    # If it's cheaper to get to this neighbor by going through this node...
    next unless costs[n] > new_cost
    # ... update the cost for this node.
    costs[n] = new_cost
    # This node becomes the new parent for this neighbor.
    parents[n] = node
  end
  # Mark the node as processed.
  @processed << node
  # Find the next node to process, and loop.
  node = find_lowest_cost_node(costs)
end

puts 'Cost from the start to each node:'
puts costs