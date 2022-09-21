import os, requests
#from jira import JIRA
from atlassian import Jira, Confluence


jira = Jira(
    url=os.getenv('host'),
    #token_auth=os.getenv('token')) #token auth not supported b/c siteminder inline
    username=os.getenv('username'),
    password=os.getenv('password'))
    #basic_auth=(os.getenv('username'), os.getenv('password')))

confluence = Confluence(
    url=os.getenv('conhost'),
    username=os.getenv('username'),
    password=os.getenv('password'))


fettheaders = {"X-Api-Key": os.environ['api_key']}

projects = requests.get("https://test-fett.apps.silver.devops.gov.bc.ca/api/v1/project", headers=fettheaders)

table = '||project||risk score||\n'

#print(projects)
for project in projects.json():
    print(project['name'])
    table = table + '|' + project['name'] + '|' + str(project['lastInheritedRiskScore']) + '|\n'

page = confluence.update_page('118948475', title='Application Risk Badges', body=table, representation='wiki')

#print(page)



#projects = jira.projects()
#print(projects)
#for project in projects:
#    print(project['key'])