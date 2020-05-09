defmodule TimeTrapper.Entities do
  @moduledoc """
  The Entities context.
  """

  import Ecto.Query, warn: false
  alias TimeTrapper.Repo

  alias TimeTrapper.Entities.User

  @doc """
  Returns the list of users.

  ## Examples

      iex> list_users()
      [%User{}, ...]

  """
  def list_users do
    Repo.all(User)
  end

  @doc """
  Gets a single user.

  Raises `Ecto.NoResultsError` if the User does not exist.

  ## Examples

      iex> get_user!(123)
      %User{}

      iex> get_user!(456)
      ** (Ecto.NoResultsError)

  """
  def get_user!(id), do: Repo.get!(User, id)

  @doc """
  Creates a user.

  ## Examples

      iex> create_user(%{field: value})
      {:ok, %User{}}

      iex> create_user(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_user(attrs \\ %{}) do
    %User{}
    |> User.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a user.

  ## Examples

      iex> update_user(user, %{field: new_value})
      {:ok, %User{}}

      iex> update_user(user, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_user(%User{} = user, attrs) do
    user
    |> User.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a user.

  ## Examples

      iex> delete_user(user)
      {:ok, %User{}}

      iex> delete_user(user)
      {:error, %Ecto.Changeset{}}

  """
  def delete_user(%User{} = user) do
    Repo.delete(user)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking user changes.

  ## Examples

      iex> change_user(user)
      %Ecto.Changeset{source: %User{}}

  """
  def change_user(%User{} = user) do
    User.changeset(user, %{})
  end

  alias TimeTrapper.Entities.Project

  @doc """
  Returns the list of projects.

  ## Examples

      iex> list_projects()
      [%Project{}, ...]

  """
  def list_projects do
    Repo.all(Project)
  end

  @doc """
  Gets a single project.

  Raises `Ecto.NoResultsError` if the Project does not exist.

  ## Examples

      iex> get_project!(123)
      %Project{}

      iex> get_project!(456)
      ** (Ecto.NoResultsError)

  """
  def get_project!(id), do: Repo.get!(Project, id)

  @doc """
  Creates a project.

  ## Examples

      iex> create_project(%{field: value})
      {:ok, %Project{}}

      iex> create_project(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_project(attrs \\ %{}) do
    %Project{}
    |> Project.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a project.

  ## Examples

      iex> update_project(project, %{field: new_value})
      {:ok, %Project{}}

      iex> update_project(project, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_project(%Project{} = project, attrs) do
    project
    |> Project.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a project.

  ## Examples

      iex> delete_project(project)
      {:ok, %Project{}}

      iex> delete_project(project)
      {:error, %Ecto.Changeset{}}

  """
  def delete_project(%Project{} = project) do
    Repo.delete(project)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking project changes.

  ## Examples

      iex> change_project(project)
      %Ecto.Changeset{source: %Project{}}

  """
  def change_project(%Project{} = project) do
    Project.changeset(project, %{})
  end

  alias TimeTrapper.Entities.UserProject

  @doc """
  Returns the list of user_projects.

  ## Examples

      iex> list_user_projects()
      [%UserProject{}, ...]

  """
  def list_user_projects do
    Repo.all(UserProject)
  end

  @doc """
  Gets a single user_project.

  Raises `Ecto.NoResultsError` if the User project does not exist.

  ## Examples

      iex> get_user_project!(123)
      %UserProject{}

      iex> get_user_project!(456)
      ** (Ecto.NoResultsError)

  """
  def get_user_project!(id), do: Repo.get!(UserProject, id)

  @doc """
  Creates a user_project.

  ## Examples

      iex> create_user_project(%{field: value})
      {:ok, %UserProject{}}

      iex> create_user_project(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_user_project(attrs \\ %{}) do
    %UserProject{}
    |> UserProject.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a user_project.

  ## Examples

      iex> update_user_project(user_project, %{field: new_value})
      {:ok, %UserProject{}}

      iex> update_user_project(user_project, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_user_project(%UserProject{} = user_project, attrs) do
    user_project
    |> UserProject.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a user_project.

  ## Examples

      iex> delete_user_project(user_project)
      {:ok, %UserProject{}}

      iex> delete_user_project(user_project)
      {:error, %Ecto.Changeset{}}

  """
  def delete_user_project(%UserProject{} = user_project) do
    Repo.delete(user_project)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking user_project changes.

  ## Examples

      iex> change_user_project(user_project)
      %Ecto.Changeset{source: %UserProject{}}

  """
  def change_user_project(%UserProject{} = user_project) do
    UserProject.changeset(user_project, %{})
  end
end
