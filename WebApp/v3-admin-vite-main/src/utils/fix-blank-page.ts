import { useTagsViewStoreHook } from "@/store/modules/tags-view"

/**
  * Function: Fix the page blank caused by the combined use of <transition> and <keep-alive>
  * Reason: It seems to be a BUG in Vue itself: https://github.com/vuejs/core/issues/7121
  * Reproduction: Without using this function, you can reproduce it by following the following steps:
  * 1. Enter a page
  * 2. Modify the TS code of this page and save it
  * 3. Go back to the browser and switch pages
  * 4. Result: The content area is not loaded and appears blank.
  */
export const fixBlankPage = () => {
  const tagsViewStore = useTagsViewStoreHook()
  tagsViewStore.cachedViews = [...tagsViewStore.cachedViews]
}
