# your code goes here
def begins_with_r(collection)
  collection.all? { |item| item[0] == "r" }
end

def contain_a(collection)
  collection.select { |item| item.include?("a") }
end

def first_wa(collection)
  collection.find do |item|
    item.class == String ? item.start_with?("wa") : nil
  end
end

def remove_non_strings(collection)
  collection.delete_if { |item| item.class != String }
end

def count_elements(collection)
  collection.group_by(&:itself).collect do |key, value|
    key.merge(count: value.size)
  end
end

def merge_data(data1, data2)
  # [data2[0].fetch("blake").merge(data1[0]), data2[0].fetch("ashley").merge(data1[1])]
  keys_array = data1
  new_data_array = data2
  result = []

  new_data_array.each do |data_hash|
    keys_array.each do |key_hash|
      key_hash.values.each do |name|
        data_hash.keys.include?(name) ? result.push(key_hash.merge(data_hash[name])) : false
      end
    end
  end

  result
end

def find_cool(collection)
  collection.select do |hashes|
    hashes.values.include?("cool") ? hashes : nil
  end
end

def organize_schools(collection)
  organized = {}
  collection.each do |school, local|
    if organized.include?(local[:location])
      organized[local[:location]] << school
    else
      organized[local[:location]] = [school]
    end
  end
  organized
end
