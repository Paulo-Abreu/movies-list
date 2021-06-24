<template>
    <div>
        <div class="card">
            <div class="row">
                <div class="col-md-12">
                    <div class="card-content">
                            <div class="header-content">
                                <div class="media-left">
                                    <h4 class="card-title mt-0">Filmes</h4>
                                </div>
                                <div>
                                    <input type="search" v-model="mySearch" class="input is-light" placeholder="Search by name" />                                
                                </div>
                                <div>
                                </div>
                            </div>
                        <div class="card-body">

                        </div>
                        <div>
                            <table class="table is-striped">

                                <tbody>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</template>

<script>
import axios from 'axios';
axios.get('https://api.themoviedb.org/3/movie/popular?api_key=e2e6c0526e3737f2381684d2fd63d354&language=en-US&page=1').then(response => {console.log("here",response.data) })
    export default {
        name: 'List',
        data(){
            return{
                movies: [],
            }
        },
        props: {
            data: {
                type: Array
            }
        },
        mounted() {
            this.movies = this.data
        },
    }
</script>
<style>
</style>