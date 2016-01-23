var project = new Project('Empty');

project.addAssets('Assets/**');

project.addLibrary('libdrp')

project.addSources('Sources');

return project;
