import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:gitify/model/repositories.dart';
import '../utils/api.dart';
import 'package:http/http.dart' as http;
class RepositoriesProvider extends ChangeNotifier 
{
  List<Repositories>? _repoList;

  List<Repositories> get repoList{
    return [..._repoList!];
    }

  Future<void> getRepositriesList(String username) async{
    final link= Uri.parse('${Api.api}/users/${username}/repos');


    try{
        final responce = await http.get(link,headers: {
          'Authorization': 'token ${Api.token}'});

        List<Repositories> newList = [];

        final responceData = json.decode(responce.body) as List<dynamic>;

        for(int i=0;i<responceData.length;i++)
        {
          Repositories repo = Repositories(
            repo_name: responceData[i]['name'],
            created_date: responceData[i]['created_at'],
            branch: responceData[i]['default_branch'],
            language: responceData[i]['language'],
            last_pushed: responceData[i]['pushed_at'],
            url: responceData[i]['html_url'],
            stars: responceData[i]['stargazers_count'],
            
            Description: responceData[i]['description']
            
            );

            newList.add(repo);
        }
        

      _repoList = newList;
      //sorting repos so that recent comes first
      _repoList!.sort((a,b) => b.created_date!.compareTo(a.created_date.toString()));
      notifyListeners();
    }
    catch(e)
    {
      print(e);
    }


  }

}

