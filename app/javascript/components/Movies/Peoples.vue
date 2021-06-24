<template>
    <div>
        <div>
            <input type="search" class="input is-light" placeholder="Search by name" />                                
        </div>
        <div class="">
            <div class="row">
                <div class="col-md-12">
                    <div class="card-content">
                            <div class="header-content">
                                <div class="media-left">
                                    <h4 class="card-title mt-0">Peoples</h4>
                                    <br>
                                </div>
                                <div>
                                </div>
                            </div>
                        <div class="card-body">
                            
                        </div>
                        <div>
                            <div class="card">
                            <table class="table is-striped">
                                <tbody>
                                    <tr v-for="people in peoples" :key="people.name">
                                        <td><img :src="img + movie.poster_path"></td>
                                        <td @click="showPeople(people.id)">
                                            <h3>{{movie.title}}</h3>
                                            <br>
                                        </td>
                                        <br>
                                        <td><p><i class="fas fa-star"></i>{{movie.vote_average}}</p></td>
                                    </tr>
                                </tbody>
                            </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</template>

<script>
import axios from 'axios';
    export default {
        name: 'Peoples',
        data(){
            return{
                peoples: [],
                img: '',
            }
        },
        props: {
            data: {
                type: Array
            }
        },
        mounted() {
            axios.get('https://api.themoviedb.org/3/person/popular?api_key=e2e6c0526e3737f2381684d2fd63d354&language=en-US&page=1').then(response => {
                this.peoples = response, 
                console.log(response) 
            })
            this.img = "https://image.tmdb.org/t/p/w500"
            
        },
        methods:{
            showList: function (event) {
                window.location = '/' 
            }        
        }
    }
</script>
<style>
.table td{
    cursor: pointer;
    padding-top: 15px;
}
.table img{
    width: 72px;
    height: auto;
}

.table{
    padding: 100px;
}
</style>