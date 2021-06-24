
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
import Peoples from '../Movies/Peoples.vue';
const componentDicionary = {
  list: List,
  sidebar: Sidebar,
  show: Show,
  peoples: Peoples,
};
export default {
  name: 'Main',
  components: {
    List, Sidebar, Show, Peoples,
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
.main-panel {
    position: relative;
    float: right;
    width: calc(100% - 260px);
    transition: .33s,cubic-bezier(.685,.0473,.346,1);
  }
  .content {
    padding-left: 15px;
    margin-right: auto;
    margin-left: auto;
  }
  .main-panel>.content {
    margin-top: 80px;
    padding: 30px 15px;
    min-height: calc(100vh - 123px);
}
.dashboard {
  width: 80%;
  margin: auto;
}
</style>