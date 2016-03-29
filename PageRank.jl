## Configuration
n = 5
adj = Float64[0 0 1 1 0;
              0 0 1 0 0;
              0 1 0 0 0;
              1 0 1 0 1;
              0 1 1 0 0]
adj ./= sum(adj,2)

## Graph algorithm
pageRank = ones(Float64,n)
N = 30
for t = 1:N
  temp = zeros(pageRank)
  for j = 1:n
    temp[j] = 0.15 + 0.85 * vecdot(pageRank,adj[:,j])
  end
  pageRank = temp
end
pageRank

## Markov Chain algorithm
comAdj = [0.85*adj 0.15*ones(n); ones(n)'/n 0.0]
comPageRank = eigvecs(comAdj')[:,1]
comPageRank = comPageRank / sum(comPageRank) * 1.15n

