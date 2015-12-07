class List
  attr_accessor :head

  def initialize(data)
    tail = nil
    @head = create_list(:head, data, tail)
  end

  private

  def create_list(head, data, tail)
    Node.new(head, data, tail)
  end

  class Node
    attr_accessor :head, :tail, :data
    def initialize(header, data_point, tailer)
      @head = header
      @tail = tailer
      @data = data_point
    end
  end

end
