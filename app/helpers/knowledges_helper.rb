module KnowledgesHelper
  def topic_last_path(knowledge)
    knowledge_path(knowledge, page: (knowledge.total_pages if knowledge.total_pages > 1))
  end
end
