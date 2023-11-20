import { useTagsViewStoreHook } from "@/store/modules/tags-view"

export const fixBlankPage = () => {
  const tagsViewStore = useTagsViewStoreHook()
  tagsViewStore.cachedViews = [...tagsViewStore.cachedViews]
}
