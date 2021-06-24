import 'bulma/css/bulma.css';
import Vue from 'vue';
import Main from '../components/Main/Main';
const parseData = (prop) => {
    try {
      return JSON.parse(prop);
    } catch (e) {
      return prop;
    }
  };
const init = () => {
  const element = document.getElementById('movies');
  if (element !== null) {
    const rawData = Object.assign({}, element.dataset);
    const propsData = Object.keys(rawData).reduce((acc, prop) => {
      acc[prop] = parseData(rawData[prop]);
      return acc;
    }, {});
    console.log(propsData)
    new Vue({
      el: element,
      render(h) {
        return h(Main, {
          props: propsData,
        });
      },
    });
  }
};

['DOMContentLoaded', 'page:load', 'page:restore'].forEach((event) => {
  document.addEventListener(event, init);
});
