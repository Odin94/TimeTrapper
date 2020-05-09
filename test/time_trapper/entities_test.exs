defmodule TimeTrapper.EntitiesTest do
  use TimeTrapper.DataCase

  alias TimeTrapper.Entities

  describe "users" do
    alias TimeTrapper.Entities.User

    @valid_attrs %{name: "some name"}
    @update_attrs %{name: "some updated name"}
    @invalid_attrs %{name: nil}

    def user_fixture(attrs \\ %{}) do
      {:ok, user} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Entities.create_user()

      user
    end

    test "list_users/0 returns all users" do
      user = user_fixture()
      assert Entities.list_users() == [user]
    end

    test "get_user!/1 returns the user with given id" do
      user = user_fixture()
      assert Entities.get_user!(user.id) == user
    end

    test "create_user/1 with valid data creates a user" do
      assert {:ok, %User{} = user} = Entities.create_user(@valid_attrs)
      assert user.name == "some name"
    end

    test "create_user/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Entities.create_user(@invalid_attrs)
    end

    test "update_user/2 with valid data updates the user" do
      user = user_fixture()
      assert {:ok, %User{} = user} = Entities.update_user(user, @update_attrs)
      assert user.name == "some updated name"
    end

    test "update_user/2 with invalid data returns error changeset" do
      user = user_fixture()
      assert {:error, %Ecto.Changeset{}} = Entities.update_user(user, @invalid_attrs)
      assert user == Entities.get_user!(user.id)
    end

    test "delete_user/1 deletes the user" do
      user = user_fixture()
      assert {:ok, %User{}} = Entities.delete_user(user)
      assert_raise Ecto.NoResultsError, fn -> Entities.get_user!(user.id) end
    end

    test "change_user/1 returns a user changeset" do
      user = user_fixture()
      assert %Ecto.Changeset{} = Entities.change_user(user)
    end
  end

  describe "projects" do
    alias TimeTrapper.Entities.Project

    @valid_attrs %{name: "some name", roles: []}
    @update_attrs %{name: "some updated name", roles: []}
    @invalid_attrs %{name: nil, roles: nil}

    def project_fixture(attrs \\ %{}) do
      {:ok, project} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Entities.create_project()

      project
    end

    test "list_projects/0 returns all projects" do
      project = project_fixture()
      assert Entities.list_projects() == [project]
    end

    test "get_project!/1 returns the project with given id" do
      project = project_fixture()
      assert Entities.get_project!(project.id) == project
    end

    test "create_project/1 with valid data creates a project" do
      assert {:ok, %Project{} = project} = Entities.create_project(@valid_attrs)
      assert project.name == "some name"
      assert project.roles == []
    end

    test "create_project/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Entities.create_project(@invalid_attrs)
    end

    test "update_project/2 with valid data updates the project" do
      project = project_fixture()
      assert {:ok, %Project{} = project} = Entities.update_project(project, @update_attrs)
      assert project.name == "some updated name"
      assert project.roles == []
    end

    test "update_project/2 with invalid data returns error changeset" do
      project = project_fixture()
      assert {:error, %Ecto.Changeset{}} = Entities.update_project(project, @invalid_attrs)
      assert project == Entities.get_project!(project.id)
    end

    test "delete_project/1 deletes the project" do
      project = project_fixture()
      assert {:ok, %Project{}} = Entities.delete_project(project)
      assert_raise Ecto.NoResultsError, fn -> Entities.get_project!(project.id) end
    end

    test "change_project/1 returns a project changeset" do
      project = project_fixture()
      assert %Ecto.Changeset{} = Entities.change_project(project)
    end
  end

  describe "user_projects" do
    alias TimeTrapper.Entities.UserProject

    @valid_attrs %{}
    @update_attrs %{}
    @invalid_attrs %{}

    def user_project_fixture(attrs \\ %{}) do
      {:ok, user_project} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Entities.create_user_project()

      user_project
    end

    test "list_user_projects/0 returns all user_projects" do
      user_project = user_project_fixture()
      assert Entities.list_user_projects() == [user_project]
    end

    test "get_user_project!/1 returns the user_project with given id" do
      user_project = user_project_fixture()
      assert Entities.get_user_project!(user_project.id) == user_project
    end

    test "create_user_project/1 with valid data creates a user_project" do
      assert {:ok, %UserProject{} = user_project} = Entities.create_user_project(@valid_attrs)
    end

    test "create_user_project/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Entities.create_user_project(@invalid_attrs)
    end

    test "update_user_project/2 with valid data updates the user_project" do
      user_project = user_project_fixture()
      assert {:ok, %UserProject{} = user_project} = Entities.update_user_project(user_project, @update_attrs)
    end

    test "update_user_project/2 with invalid data returns error changeset" do
      user_project = user_project_fixture()
      assert {:error, %Ecto.Changeset{}} = Entities.update_user_project(user_project, @invalid_attrs)
      assert user_project == Entities.get_user_project!(user_project.id)
    end

    test "delete_user_project/1 deletes the user_project" do
      user_project = user_project_fixture()
      assert {:ok, %UserProject{}} = Entities.delete_user_project(user_project)
      assert_raise Ecto.NoResultsError, fn -> Entities.get_user_project!(user_project.id) end
    end

    test "change_user_project/1 returns a user_project changeset" do
      user_project = user_project_fixture()
      assert %Ecto.Changeset{} = Entities.change_user_project(user_project)
    end
  end
end
