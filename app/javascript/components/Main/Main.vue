
<template>
<div>
  <div class="wrapper">
    <div>
        <div class="main-panel">
          <div class="content">
            <header> 
            </header>
            <Sidebar />
            <div class="dashboard">
             <component :is="loadComponent" :data="componentData" />
            </div>
          </div>
        </div>
    </div>
  </div>
</div>
</template>

<script>
import List from '../Movies/List.vue';
import Sidebar from '../Sidebar/Sidebar.vue';
import Show from '../Movies/ShowMovie.vue';
import Peoples from '../People/Peoples.vue';
import ShowPeople from '../People/ShowPeople.vue';
import Favorites from '../Favorites/MyMovies.vue';
import Series from '../Series/Series.vue';
import ShowSerie from '../Series/ShowSerie.vue';
const componentDicionary = {
  list: List,
  sidebar: Sidebar,
  show: Show,
  peoples: Peoples,
  show_people: ShowPeople,
  favorites: Favorites,
  series: Series,
  show_serie: ShowSerie,
};
export default {
  name: 'Main',
  components: {
    List, Sidebar, Show, Peoples, ShowPeople, Favorites, Series, ShowSerie,
  },
  props: {
    componentName: {
      type: String,
      required: true,
    },
    componentData: {
      type: Array
    }
  },
  computed: {
    loadComponent() {
      return componentDicionary[this.componentName]
    }
  },
}
</script>

<style>

</style>