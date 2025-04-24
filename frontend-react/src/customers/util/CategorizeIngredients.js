export const categorizedIngredients = (ingredients) => {
  if (!Array.isArray(ingredients)) {
    return {};
  }

  return ingredients.reduce((acc, ingredient) => {
    const { category } = ingredient;
    const categoryName = category?.name || "Uncategorized"; // $ảm bảo category.name tồn tại, nếu không, $ặt tên là "Uncategorized"

    if (!acc[categoryName]) {
      acc[categoryName] = [];
    }
    acc[categoryName].push(ingredient);
    return acc;
  }, {});
};
