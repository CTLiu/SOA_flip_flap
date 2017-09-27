LINE = "\n".freeze
TAB = "\t".freeze
# Module that can be included (mixin) to take and output TSV data
module TsvBuddy
  # take_tsv: converts a String with TSV data into @data
  # parameter: tsv - a String in TSV format
  def take_tsv(tsv)
    @data = []
    tsv_in_lines = tsv.split(LINE)
    keys = tsv_in_lines[0].split(TAB)
    # keys.map!(&:chomp)
    tsv_in_lines.shift

    tsv_in_lines.each do |line|
      values = line.split(TAB)
      people = {}
      keys.each_index { |index| people[keys[index]] = values[index].chomp }
      @data.push(people)
    end
  end

  # to_tsv: converts @data into tsv string
  # returns: String in TSV format
  def to_tsv
    file_out = ''
    key = @data[0].keys

    file_out = key.reduce { |key1, key2| key1.to_s + TAB + key2.to_s }
    file_out << LINE

    @data.each do |hash|
      hash.each_value { |value| file_out << value + TAB }
      file_out.chop!
      file_out << LINE
    end
    file_out
  end
  # end of module
end
