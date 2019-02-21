//Idea from https://github.com/gabrielelana/mongodb-shell-extensions/
DBCollection.prototype.distinctAndCount = function(field, query) {
  query = query || {}

  return this.aggregate(
      {$match: query},
      {$group: {_id: '$' + field, count: {$sum: 1}}},
      //{$project: {values: '$_id', count: 1, _id: 0}},
      {$sort: {count: -1}}
  )
}
