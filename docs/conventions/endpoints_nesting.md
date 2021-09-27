zagnieżdżenie w sekcji endpoints musi być zgodne z zagnieżdżeniem w routes.rb 
np.

namespace :activityres do
    get "/create" => "activities#create"
    ...
end

zostanie pokazane w sekcji enpoints jako /activityres/create.md
